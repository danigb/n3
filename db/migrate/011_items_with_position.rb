class ItemsWithPosition < ActiveRecord::Migration
  def self.up
		add_column :items, 'position', :string, :length => 8
  end

  def self.down
		remove_column :items, 'position'  
  end
end
