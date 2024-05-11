class RestrictedSitesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_restricted_site, only: [:show, :update, :destroy]
  
    # GET /restricted_sites
    def index
      @restricted_sites = current_user.restricted_sites
      render json: @restricted_sites
    end
  
    # POST /restricted_sites
    def create
      @restricted_site = current_user.restricted_sites.build(restricted_site_params)
  
      if @restricted_site.save
        render json: @restricted_site, status: :created
      else
        render json: @restricted_site.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /restricted_sites/:id
    def destroy
      @restricted_site.destroy
      head :no_content
    end
  
    private
  
    def set_restricted_site
      @restricted_site = current_user.restricted_sites.find(params[:id])
    end
  
    def restricted_site_params
      params.require(:restricted_site).permit(:url)
    end
  end
  