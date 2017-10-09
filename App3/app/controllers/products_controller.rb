class ProductsController < Api::V1::ApiController
	
	def new
	  	@product = Product.new
	  	respose = HTTParty.get("http://localhost:3002/api/v1/categories")
	  	@categories = JSON.parse(respose.body)["categories"]
	end

	def create
	  	@product = Product.new(product_params)
	  	if @product.save
	  		redirect_to new_product_path, notice: "created"
	  	end
	end
end
