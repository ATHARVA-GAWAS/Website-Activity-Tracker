# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
    def create
      # Logic for user authentication
      if login_successful
        redirect_to root_path, notice: "Login successful!"
      else
        flash.now[:alert] = "Invalid email or password"
        render :new
      end
    end
  
    # Other actions...
  
  end
  