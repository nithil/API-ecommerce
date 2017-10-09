class ProductsController < ApplicationController

	def index
		response = HTTParty.get("http://localhost:3003/api/v1/products")
		@products = JSON.parse(response.body)["products"]		
	end

	def show
		response = HTTParty.get("http://localhost:3003/api/v1/products/#{params["id"]}")
		@product = JSON.parse(response.body)["products"]
	end
end
