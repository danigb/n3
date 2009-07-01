class ItemImage < ActiveRecord::Base
  belongs_to :item
  acts_as_attachment :storage => :file_system, :thumbnails => { :normal => '300>', :thumb => '75' }
	acts_as_list :column => :listpos,  :scope => :item
	
	def before_save
		if position == 'main image'
			assigned = ItemImage.find_by_item_id_and_position(item_id, position)
			assigned.update_attribute(:position, 'none') unless assigned.nil?
		end

		if (position.nil? && self.is_image?)
			self.position= "slideshow"
		elsif (position.nil?)
			self.position= "pdf"
		end
	end

	def is_image?
		content_type =~ /^image/
	end
end
