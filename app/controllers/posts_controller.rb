class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    authorize! :create, Post, message: "You need to be a member to create a new post."
  end

  # Adding a create method to the posts_controller.rb
  def create
    @post = current_user.posts.build(params[:post])
    
    authorize! :create, @post, message: "You need to be signed up to do that"
    
    if @post.save
      flash[:notice] = "Post was saved"
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again"
      render :new
    end
  end

  def edit
  end

end
