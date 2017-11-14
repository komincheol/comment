class PostController < ApplicationController
  def index
    @posts= Post.all
  end

  def new
  end

  def create
    Post.create(
      title: params[:title],
      content: params[:content],
      user_id: session[:user_id]
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
  
  def modify
    @id = params[:id]
    @post = Post.find(@id)
  end
  
    def destroy
    @id = params[:id]
    @post = Post.find(@id)
    
    @post.destroy
    
    redirect_to "/"
    end
  
  
    def update
    # 1번 글에 대해서 나는 수정을 할거야
    # 1번 글을 찾는다.
    @id = params[:id]
    @post = Post.find(@id)
    # 해당 글을 업데이트한다.
    @post.update(
      title: params[:title],
      content: params[:content]
    )
    
    redirect_to "/post/show/#{@id}"
    end
  
end
