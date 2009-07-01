class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.column "title", :string
      t.column "content", :string
      t.column "time_period_id", :integer
    end
  end
  
  def self.down
    drop_table :items
  end
end
