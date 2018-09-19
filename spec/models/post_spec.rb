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

    it 'cannot be created without date and rationale and overtime_hours' do
      post = Post.new
      expect(post).not_to be_valid
    end

    it 'cannot be created if overtime_hours is not greater than 0.0' do
      post = Post.new(rationale: 'rationale', date: Date.today, overtime_hours: 0.0)

      expect(post).not_to be_valid
    end
  end
end
