class CreateServiceOffers < ActiveRecord::Migration
  def self.up
    create_table :service_offers do |t|
t.column "type", :text
t.column "content", :text, {:limit => 4096, :null => false}
t.column "item_image_id", :integer
    end


  end

  def self.down
    drop_table :service_offers
  end
end
