class ImageItemFixedThumbnails < ActiveRecord::Migration
  def self.up
		rename_column :item_images, "parent_id", "item_id"
    add_column :item_images, "parent_id", :integer
  end

  def self.down
		remove_column :item_images, "parent_id"
		rename_column :item_images, "item_id", "parent_id"
  end
end
