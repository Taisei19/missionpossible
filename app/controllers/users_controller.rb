class UsersController < ApplicationController
  
  def create
    @user = User.new(user_params)
    if params[:user][:username] == ENV['TEACHER_USERNAME'] && params[:user][:password] == ENV['TEACHER_PASSWORD']
      @user.role = "teacher"
    else
      @user.role = "student"
    end
  
    if @user.save
      # 成功時の処理
    else
      # エラー処理
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
end