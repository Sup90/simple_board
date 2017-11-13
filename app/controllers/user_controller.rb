class UserController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def create
    @email = params[:email]
    @password = params[:password]
    
    User.create(
      email: @email,
      password: @password
    )
    
    redirect_to '/'
  end

  def show
  end
  
  def login
  end
  
  def login_process
    @user = User.find_by(email: params[:email])
    if @user
      if @user.password == params[:password]
        session[:user_id] = @user.id
        flash[:notice] = "로그인이 되었습니다."
        redirect_to '/'
      else
        flash[:notice] = "비밀번호가 틀렸습니다."
        redirect_to '/user/login'
      end
    end
  end
  
  def logout
    session.clear
    flash[:notice] = "로그아웃되었습니다."
    redirect_to '/'
  end
end
