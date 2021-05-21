class PostsController < ApplicationController

  $LIKES = 0
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to root_url
  end

  def index
    # can greet the logged in user
    # Can add this in in a before statement at the top - using a private method to do find function
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    end
    @post = Post.new
    @posts = Post.all.order('created_at DESC')
  end

  def likes
    post = Post.find_by(id: params[:id])
    post.update(:likes => (post.likes += 1))
    redirect_to root_url
  end

  # def show
  #   @post = Post.find(params[:id])
  # end


  private

  def post_params
    params.require(:post).permit(:message, :likes)
  end

  
end
