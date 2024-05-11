class TimeLimitsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_time_limit, only: [:show, :update, :destroy]
  
    # GET /time_limits
    def index
      @time_limits = current_user.time_limits
      render json: @time_limits
    end
  
    # POST /time_limits
    def create
      @time_limit = current_user.time_limits.build(time_limit_params)
  
      if @time_limit.save
        render json: @time_limit, status: :created
      else
        render json: @time_limit.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /time_limits/:id
    def destroy
      @time_limit.destroy
      head :no_content
    end
  
    private
  
    def set_time_limit
      @time_limit = current_user.time_limits.find(params[:id])
    end
  
    def time_limit_params
      params.require(:time_limit).permit(:website, :limit_in_minutes)
    end
  end
  