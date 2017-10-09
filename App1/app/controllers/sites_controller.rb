class SitesController < ApplicationController
	# require 'ostruct'
  def index
  	#binding.pry
  	category_response =  HTTParty.get("http://localhost:3002/api/v1/categories")
  	@categories = JSON.parse(category_response.body)

  	product_response = HTTParty.get("http://localhost:3003/api/v1/products")
  	@products = JSON.parse(product_response.body)
  	#binding.pry
  end
end
