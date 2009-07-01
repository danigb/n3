class ItemsHaveLinks < ActiveRecord::Migration
  def self.up
		add_column :items, 'link', :string
  end

  def self.down
		remove_column :items, 'link'  
  end

end
