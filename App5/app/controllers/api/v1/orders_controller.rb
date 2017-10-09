class Api::V1::OrdersController < Api::V1::ApiController

	def index
		@orders = Order.all
	end

	def create
		#binding.pry
		@order = Order.new(order_params)
		@order.order_date = Date.today
		@order.order_no = "ecom#{Random.rand(1000)}"
		if @order.save
			redirect_to :back, notice: "Your order has been placed"
		else
			redirect_to :back, notice: "No"
		end
	end
	
	private

	def order_params
		params.permit(:user_id, :total)
	end
end
