class AllItemsHaveGroup < ActiveRecord::Migration
  def self.up
		all = Item.find(:all)
		all.each do |item| 
			item.subcategory = 'all' if item.subcategory.nil? 
			item.save
		end
  end

  def self.down
  end
end
