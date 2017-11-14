class UserController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def create
    @email= params[:email]
    @name= params[:name]
    @password= params[:password]
    
    User.create(
      email: @email,
      name: @name,
      password: @password
      )
      
      redirect_to '/'
  end

  def show
  end
  
  def login
  end
  
  #1. DB에 유저가 없을때(params[:email]로 DB검색시 없을때)
  #2. DB에 유저가 있는데,
    # -패스워드가 다를 때 => "패스워드가 틀렸어"
    # -패스워드가 맞을 때 => "패스워드가 맞았어"
  def login_process
    @user=User.find_by(email: params[:email])
    if @user
      if @user.password == params[:password]
        session[:user_id] = @user.id
        flash[:notice] = "로그인이 되었습니다."
        redirect_to '/'
      else
        flash[:alert] = "비밀번호가 틀렸습니다."
        redirect_to '/user/login'
      end
    else
      flash[:alert] = "그런 이메일의 유저가 없어요"
    end
    
  end
  
  def logout
    
  session.clear
  flash[:notice] = "로그아웃되었습니다."
  redirect_to '/'
  end
  
  def note
  end

end
