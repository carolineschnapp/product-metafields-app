class CreateMetafields < ActiveRecord::Migration
  def self.up
    create_table :metafields do |t|
      t.string :namespace
      t.string :key
      t.string :value
      t.string :value_type
      t.string :description
      t.integer :product_id
      t.integer :id_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :metafields
  end
end
