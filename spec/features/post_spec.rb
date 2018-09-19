require 'rails_helper'

describe 'navigate' do
  let(:user) { FactoryGirl.create(:user) }

  before {
    login_as(user, :scope => :user)
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

    it 'has a scope that creators only see their post' do
      post1 = FactoryGirl.create(:post)
      post2 = Post.create(rationale: 'My rationale', date: Date.today, user_id: user.id)
      visit posts_path
      expect(page).to have_content(/My rationale/)
      expect(page).to_not have_content(/Some Rationale/)
    end
  end

  describe 'new' do
    it 'has a link on homepage' do
      visit root_path
      click_link('new_post_from_nav')
      expect(page.status_code).to eq 200
    end
  end

  describe 'delete' do
    it 'can be deleted from index' do
      post = Post.create(rationale: 'My rationale', date: Date.today, user_id: user.id)
      visit posts_path
      click_link("delete_post_#{post.id}_form_index")
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
      @post = Post.create(rationale: 'rationale', date: Date.today, user_id: user.id)
    end

    it 'can be edited by who created it' do
      visit edit_post_path(@post)
      fill_in 'post[rationale]', with: 'Edited rationale'
      click_on 'Save'
      expect(page).to have_content 'Edited rationale'
    end

    it 'cannot be edited by non authorized user' do
      logout(:user)
      non_authorized_user = FactoryGirl.create(:user)
      login_as(non_authorized_user, :scope => :user)
      visit edit_post_path(@post)
      expect(current_path).to eq root_path
    end
  end
end
