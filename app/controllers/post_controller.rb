class PostController < ApplicationController
  def index
    @posts= Post.all
  end

  def new
  end

  def create
    Post.create(
      title: params[:title],
      content: params[:content]
      )
    redirect_to '/'
  end

  def show
   @post=Post.find(params[:id])
   

  end

  def create_comment
    Comment.create(
      content: params[:content],
      post_id: params[:id]
      )
      redirect_to :back
  end
end
