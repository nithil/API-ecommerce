class Api::V1::LineItemsController < Api::V1::ApiController

	def index
		@line_items = LineItem.all
	end

	def create
		@line_item = LineItem.new(line_item_params)
		if @line_item.save_or_update 
			redirect_to :back, notice: "Added to cart"
		else
			redirect_to :back, notice: "No"
		end
	end

	def show
		@line_item = LineItem.find(params[:id])
	end

	def destroy	
	#binding.pry	
		@line_item = LineItem.find(params["id"])
		@line_item.destroy
		redirect_to :back
	end

	private

	def line_item_params
		params.permit(:user_id, :product_id, :quantity)
	end
end
