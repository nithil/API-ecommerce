class LineItem < ActiveRecord::Base

	def save_or_update
		#binding.pry
		line_item = LineItem.find_by(user_id: self.user_id, product_id: self.product_id)
		if line_item.nil?
			self.save
		else
			line_item.update_attributes(quantity: line_item.quantity + self.quantity)
		end
	end
end
