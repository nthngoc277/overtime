class HomeController < ApplicationController
  def index
    @pending_approvals = Post.submitted
  end
end
