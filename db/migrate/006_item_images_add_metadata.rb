class ItemImagesAddMetadata < ActiveRecord::Migration
  def self.up
		add_column :item_images, 'title', :string
		add_column :item_images, 'extra', :string
		add_column :item_images, 'position', :string
    add_column :item_images, 'created_on', :timestamp
  end

  def self.down
		remove_column :item_images, 'title'
		remove_column :item_images, 'extra'
		remove_column :item_images, 'position'
		remove_column :item_images, 'created_on'
  end
end
