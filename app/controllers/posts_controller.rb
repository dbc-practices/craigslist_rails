class PostsController < ApplicationController

  def new
  end

  def create
    user = User.find(session[:user_id])
    user.posts.create(post_params)
    redirect_to :controller => "welcome", :action => 'index' # redirect with _path helper methods
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update_attributes(post_params)
    redirect_to :controller => "welcome", :action => 'index' # use _path helper methods
  end

  def destroy
    post = Post.find(params[:id])
    puts post.inspect # don't commit this
    post.destroy
    post.inspect # don't commit these debug lines
    redirect_to :controller => "welcome", :action => 'index' # _path helpers
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category)
  end
end
