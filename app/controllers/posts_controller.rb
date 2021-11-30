class PostsController < ApplicationController
  include Help
  include PostsHelper
  require 'require'

  def index
    @post=Post.all
  end

  def show
    @post= Post.find(params[:id])
    @s_id=session[:session_id]  
    session[:session_id]="My Session"
    PostsController.new.test
    t=CheckRequire.new.test
    # helper
    byebug
  end

  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def edit
    @post=Post.find(params[:id])
  end

  def update
    @post=Post.find(
    params[:id]
    )
    if @post.update(check_params)
      redirect_to posts_path
    else render 'edit'
    end
  end

  def new
    @post= Post.new
  end

  def create
    # byebug
    @post= Post.new(check_params)
    if @post.save
      redirect_to posts_path
    else 
      render 'new'
  end
end
private
def check_params
  params.require(:post).permit(:author, :ptype)
end

end
