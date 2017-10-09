class Api::V1::ProductsController < ApplicationController
	before_action :set_product, only: [:update, :destroy]

	def index
		if params[:category_id]
			#binding.pry
			@products = Product.where('category_id = ?', params[:category_id])
		else
			@products = Product.all
		end
	end

	def new
	  	@product = Product.new
	  	response = HTTParty.get("http://localhost:3002/api/v1/categories")
	  	@categories = JSON.parse(response.body)["categories"]
	end

	def create
	  	@product = Product.new(product_params)
	  	if @product.save
	  		redirect_to new_product_path, notice: "created"
	  	end
	end

	def show
		if params[:id]
			@product = Product.find(params[:id])
		else
		respose = HTTParty.get("http://localhost:3002/api/v1/categories/#{@product.category_id}")
		#binding.pry
		@c_name = JSON.parse(respose.body)["categories"]["name"]
		#binding.pry
	end
	end

	def update
		if @product.update_attributes(product_params)
			render 'update.json'
		else
			render 'errors.json'
		end
	end

	def destroy
		@product.destroy
	end

  	private

  	def set_product
		@product = Product.find(params[:id])  		
  	end

  	def product_params
  		params[:product].permit(:name,:price,:category_id)
  	end
end
