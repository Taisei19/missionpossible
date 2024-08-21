class UsersController < ApplicationController
  
  def new
    @user = User.new
    super
  end
  
  def create
    @user = User.new(user_params)
    if params[:user][:username] == ENV['TEACHER_USERNAME'] && params[:user][:password] == ENV['TEACHER_PASSWORD']
      @user.role = "teacher"
    else
      @user.role = "student"
    end
    
    if @user.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
 
    
  end
  
  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name,  :email, :password, :password_confirmation, :role)
  end

end