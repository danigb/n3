class Item < ActiveRecord::Base
  belongs_to :time_period
	belongs_to :item_image
  has_many :item_images, :foreign_key => :item_id, :order => 'listpos'

	def self.find_projects(years)
		items = []
		years.each do |year|
			Item.find(:all, :conditions => ['category = ? AND subcategory = ?', 'projects', year], 
				:order => 'position').each {|i| items << i}
		end
		items
	end

	def front_image
    ItemImage.find_by_item_id_and_position(id, "main image")
	end

	def slideshow 
		ItemImage.find_all_by_item_id_and_position(id, "slideshow", :order => 'listpos')
	end

	def index_image
		ItemImage.find_by_item_id_and_position(id, "index image")
	end

	def main_image
		ItemImage.find_by_item_id_and_position(id, "main image")
	end

	def map_image
		ItemImage.find_by_item_id_and_position(id, "map")
	end

	def pdfs
		ItemImage.find_all_by_item_id_and_position(id, "pdf", :order => 'listpos')
	end

  def before_save
  end

  private
	def before_save_news_logic
		if category == 'news' && subcategory != 'kein'
			assigned = Item.find_by_category_and_subcategory('news', subcategory)
			assigned.update_attribute(:subcategory, 'kein') unless assigned.nil?
		end
	end
end
