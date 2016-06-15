class PostsController < ApplicationController

  def index
    posts = Post.paginate(page: params[:page], per_page: params[:per_page]).all
    @paginator = Paginator.new(posts, self)
  end

end
