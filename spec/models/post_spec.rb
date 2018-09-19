require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Creation' do
    let(:user) { FactoryGirl.create(:user) }
    
    before {
      login_as(user, :scope => :user)
    }
    
    it 'can be created' do
      post = FactoryGirl.build_stubbed(:post)
      expect(post).to be_valid
    end

    it 'cannot be created without date and rationale' do
      post = Post.new
      expect(post).not_to be_valid
    end
  end
end
