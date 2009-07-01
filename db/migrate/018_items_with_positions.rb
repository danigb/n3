class ItemsWithPositions < ActiveRecord::Migration
  def self.up
  	add_column :item_images, :listpos, :integer
  	
  	items = Item.find :all
  	
  	items.each do |item|
  		item.item_images.each_with_index{|image, index| image.update_attribute(:listpos, index)}
  	end
  end

  def self.down
  	remove_column :item_images, :listpos
  end
end
