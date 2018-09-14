require 'rails_helper'

describe 'navigate' do

  before {
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  }

  describe 'index' do
    it 'can be reached successfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      visit posts_path
      expect(page).to have_content(/Posts/)
    end

    it 'has list of posts' do
      post1 = FactoryGirl.create(:post)
      post2 = FactoryGirl.create(:second_post)
      visit posts_path
      expect(page).to have_content(/Some Rationale|Some other Rationale/)
    end
  end

  describe 'new' do
    it 'has a link on homepage' do
      visit root_path
      click_link('new_post_from_nav')
      expect(page.status_code).to eq 200
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Some rationale'
      click_on 'Save'
      expect(page).to have_content 'Some rationale'
    end

    it 'will have a user associated it' do
      fill_in "post[date]", with: Date.today
      fill_in "post[rationale]", with: 'Some rationale'

      click_on "Save"
      expect(User.last.posts.last.rationale).to eq 'Some rationale'
    end
  end

  describe 'edit' do
    before do
      @post = FactoryGirl.create(:post)
    end

    it 'can be reached by click on edit link' do
      visit posts_path
      click_link("edit_#{@post.id}")
      expect(page.status_code).to eq 200
    end

    it 'can be edited' do
      visit edit_post_path(@post)
      fill_in 'post[rationale]', with: 'Edited rationale'
      click_on 'Save'
      expect(page).to have_content 'Edited rationale'
    end
  end
end
