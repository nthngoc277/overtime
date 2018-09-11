require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Creation' do
    before {
      @user ||= User.create(email: 'ngoc@redjourney2016.com', password: '123456', password_confirmation: '123456', first_name: 'Ngoc', last_name: 'Nguyen')  
      login_as(@user, :scope => @user)
    }
    it 'can be created' do
      post = Post.new(date: Date.today, rationale: 'Anything', user_id: @user.id)
      expect(post).to be_valid
    end

    it 'cannot be created without date and rationale' do
      post = Post.new
      expect(post).not_to be_valid
    end
  end
end
