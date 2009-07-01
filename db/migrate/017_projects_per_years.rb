class ProjectsPerYears < ActiveRecord::Migration

  def self.subcategories
		[ '2004 | 2005 | 2006 | 2007', '2000 | 2001 | 2002 | 2003', '1996 | 1997 | 1998 | 1999']
   end
	
  def self.up
  	change_subcategory subcategories[0], '2004'
  	change_subcategory subcategories[1], '2000'
  	change_subcategory subcategories[2], '1996'
  end

  def self.down
  	change_subcategory '2004', subcategories[0]
  	change_subcategory '2000', subcategories[1]
  	change_subcategory '1996', subcategories[2]
  end
  
  def self.change_subcategory(before, after)
    items = Item.find(:all, :conditions => ['category = ? AND subcategory = ?', 'projects', before])
  	items.each {|item| item.update_attribute('subcategory', after) }
  end
end
