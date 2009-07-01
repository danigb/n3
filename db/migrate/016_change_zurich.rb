class ChangeZurich < ActiveRecord::Migration
  def self.up
  		items = Item.find(:all, :conditions => ['subcategory = ?', 'Zurich'])
  		items.each {|item| item.update_attribute('subcategory', 'Zürich') }
  end

  def self.down
  		items = Item.find(:all, :conditions => ['subcategory = ?', 'Zürich'])
  		items.each {|item| item.update_attribute('subcategory', 'Zurich') }
  end
end
