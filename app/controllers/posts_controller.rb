class PostsController < ApplicationController
  def index
    @posts = Post.all()
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save!
      flash[:notice] = 'Zapisanoa posta'
      redirect_to action: 'index'
    else
      flash[:notice] = "Nie zaisano"
      render action: :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :avatar)
  end
end
