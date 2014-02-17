class PostsController < ApplicationController

  def new
  end

  def create
    user = User.find(session[:user_id])
    user.posts.create(post_params)
    redirect_to :controller => "welcome", :action => 'index'
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
    redirect_to :controller => "welcome", :action => 'index'
  end

  def destroy
    post = Post.find(params[:id])
    puts post.inspect
    post.destroy
    post.inspect
    redirect_to :controller => "welcome", :action => 'index'
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category)
  end
end
