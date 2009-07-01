class ItemHasSubcategory < ActiveRecord::Migration
  def self.up
		add_column :items, 'subcategory', :string
		add_column :items, 'created_on', :timestamp
		add_column :items, 'updated_on', :timestamp
  end

  def self.down
		remove_column :items, 'subcategory'  
		remove_column :items, 'created_on'  
		remove_column :items, 'updated_on'
	end
end
