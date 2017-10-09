class OrdersController < ApplicationController

	def index
		response = HTTParty.get("http://localhost:3005/api/v1/orders")
		#binding.pry
		@order = JSON.parse(response.body)["orders"]
		@orders	= @order.find_all{|n| n["user_id"] == current_user.id}	
	end
end
