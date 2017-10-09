class Order < ActiveRecord::Base
	after_create :copy_line_items_to_order_line_items
	after_create :empty_line_items

	private

	def copy_line_items_to_order_line_items
		#binding.pry
		response = HTTParty.get("http://localhost:3004/api/v1/line_items")
		@line_item = JSON.parse(response.body)["line_items"]
		@line_items	= @line_item.find_all{|n| n["user_id"] == self.user_id}

		@line_items.each do |line_item|
			order_line_item = OrderLineItem.new
			response = HTTParty.get("http://localhost:3003/api/v1/products/#{line_item["product_id"]}")
			@product = JSON.parse(response.body)["products"]

			order_line_item.order_id = self.id 
			order_line_item.product_id = line_item["product_id"]
			order_line_item.quantity = line_item["quantity"]
			order_line_item.price = @product["price"]
			order_line_item.save
			#binding.pry
		end
	end

	def empty_line_items
		@line_items.each do |line_item|
			line_item["id"]
			HTTParty.delete("http://localhost:3004/api/v1/line_items/#{line_item["id"]}")
		end
	end
end
