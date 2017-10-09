class Api::V1::OrderLineItemsController < Api::V1::ApiController

	def index
		@order_line_items = OrderLineItem.all
	end

	# def create
	# 	binding.pry
	# 	@order_line_item = OrderLineItem.new
	# end

	def show
		@order_line_item = OrderLineItem.find(params[:id])
	end
end
