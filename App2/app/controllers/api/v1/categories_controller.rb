class Api::V1::CategoriesController < Api::V1::ApiController
	before_action :set_category, only: [:show, :update, :destroy]
	def index
		@categories = Category.all
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			render 'create.json'
		else
			render 'errors.json'
		end
	end

	def update
		if @category.update_attributes(category_params)
			render 'update.json'
		else
			render 'errors.json'
		end
	end

	def show
		if params[:with]=="products"
			#binding.pry
			response = HTTParty.get("http://localhost:3003/api/v1/products?category_id=#{@category.id}")
			@products = JSON.parse(response.body)["products"]
			#binding.pry
		end
	end

	def destroy
		@category.destroy
	end

	private

	def set_category
		@category = Category.find(params[:id])
	end

	def category_params
		params[:category].permit(:name)
	end
end
