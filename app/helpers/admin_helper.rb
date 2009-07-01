module AdminHelper
	def render_group(item)
#		if item.category == 'news'
#			image_tag item.subcategory + ".gif"
#		else
			item.subcategory
#		end
	end	

	def has_link(category)
		category == 'news' || category == 'contact' || category == 'team'
	end


	def render_thumb(attachment)
		if attachment.is_image?
			 image_tag attachment.public_filename, :size => "30x30"
		end
	end
end
