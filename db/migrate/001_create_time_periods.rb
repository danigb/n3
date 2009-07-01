class CreateTimePeriods < ActiveRecord::Migration
  def self.up
    create_table :time_periods do |t|
      t.column "title", :string
    end
    
    TimePeriod.new(:title => "1996 | 1997 | 1998 | 1999").save
    TimePeriod.new(:title => "2000 | 2001 | 2002 | 2003").save
    TimePeriod.new(:title => "2004 | 2005 | 2006 | 2007").save
  end
  
  def self.down
    drop_table :time_periods
  end
end
