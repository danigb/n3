class NewsUsesPositions < ActiveRecord::Migration
  def self.up
		news = Item.find(:all, :conditions => ['category = ?', 'news'])
		news.each {|item| item.update_attribute('subcategory', 'all') }
  end

  def self.down
  end
end
