require 'rails_helper'

describe 'navigation' do
  let(:admin_user) { FactoryGirl.create(:admin_user) }
  let(:user) { FactoryGirl.create(:user) }

  describe 'edit' do
    before do
      @post = FactoryGirl.create(:post)
    end

    it 'has a status can be edited on the form by admin' do
      login_as(admin_user, scope: :user)
      visit edit_post_path(@post)
      choose 'post_status_approved'
      click_on 'Save'

      expect(@post.reload.status).to eq 'approved'
    end

    it 'cannot be edited by a non admin' do
      login_as(user, scope: :user)

      visit edit_post_path(@post)

      expect(page).to_not have_content('Approved')
    end

    it 'cannot to be edited by owner after it is approved' do
      login_as(user, scope: :user)
      post = Post.create(rationale: 'rationale', date: Date.today, user_id: user.id)
      post.approved!
      visit(edit_post_path(post))
      expect(current_path).to eq root_path
    end
  end
end
