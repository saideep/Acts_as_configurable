
class ActsAsConfigurable < ActiveRecord::Migration
  def self.up
    create_table :configurations do |t|
      t.text :data
      t.integer :creator_id 
      t.string :creator_type 
      t.timestamps
    end
  end
  
  def self.down
    drop_table :configurations
  end
  
end
