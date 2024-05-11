# app/controllers/users_controller.rb
class UsersController < ApplicationController
    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to login_path, notice: "User created successfully. Please log in."
      else
        render :new
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:email, :password)
    end
  end
  