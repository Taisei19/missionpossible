class UsersController < ApplicationController
  
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
end