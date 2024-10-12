class HomeController < ApplicationController

  def index
    @crops = Crop.all
    @recent_posts = Post.order(created_at: :desc).limit(5)
  end
end
