class PostController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def create
    @title = params[:title]
    @content = params[:content]
    
    Post.create(
      title: @title,
      content: @content,
      user_id: session[:user_id]
    )
    redirect_to '/'
  end

  def show
    @id = params[:id]
    @post = Post.find(@id)
    
  end
  
  def modify
    @id = params[:id]
    @post = Post.find(@id)
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
  
  def destroy
    @id = params[:id]
    @post = Post.find(@id)
    
    @post.destroy
    
    redirect_to "/"
  end
end
