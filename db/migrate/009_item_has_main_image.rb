class ItemHasMainImage < ActiveRecord::Migration
  def self.up
		add_column :items, 'item_image_id', :integer
		add_column :items, 'extra', :string

  end

  def self.down
		remove_column :items, 'extra'  
		remove_column :items, 'item_image_id'  
  end
end
