class LineItemsController < ApplicationController

	def index
		#binding.pry
		response = HTTParty.get("http://localhost:3004/api/v1/line_items")
		@line_item = JSON.parse(response.body)["line_items"]
		@line_items	= @line_item.find_all{|n| n["user_id"] == current_user.id}
	end
end
