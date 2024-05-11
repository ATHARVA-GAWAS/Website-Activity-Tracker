class WebsiteVisitsController < ApplicationController
    before_action :authenticate_user!
  
    def create
      @website_visit = current_user.website_visits.new(website_visit_params)
      if @website_visit.save
        render json: @website_visit, status: :created
      else
        render json: @website_visit.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def website_visit_params
      params.require(:website_visit).permit(:url, :visit_time)
    end
  end
  