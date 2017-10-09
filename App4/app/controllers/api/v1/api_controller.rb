class Api::V1::ApiController < ApplicationController
	skip_before_action :verify_authenticity_token
	
  rescue_from ActiveRecord::RecordNotFound do 
    redirect_to root_path, notice: "Page not found"
  end
end