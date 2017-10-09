class CategoriesController < ApplicationController

	def index
	  	category_response =  HTTParty.get("http://localhost:3002/api/v1/categories")
	  	@categories = JSON.parse(category_response.body)["categories"]
	end

	def show		
	  	category_response =  HTTParty.get("http://localhost:3002/api/v1/categories/#{params["id"]}?with=products")
	  	@category = JSON.parse(category_response.body)["categories"]
	  	@products = JSON.parse(category_response.body)["products"]
	  	#binding.pry
  		# product_response = HTTParty.get("http://localhost:3003/api/v1/products")
  		# @product = JSON.parse(product_response.body)["products"]
  		# # binding.pry
  		# @products = @product.find_all{|n| n["category_id"] == @category["id"]}
  		# binding.pry
	end
end
