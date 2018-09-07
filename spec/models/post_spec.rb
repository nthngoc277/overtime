require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Creation' do
    before {
      @post = Post.new(date: Date.today, rationale: 'Anything')
    }
    it 'can be created' do
      expect(@post).to be_valid
    end

    it 'cannot be created without date and rationale' do
      @post.date = nil
      @post.rationale = nil
      expect(@post).not_to be_valid
    end
  end
end
