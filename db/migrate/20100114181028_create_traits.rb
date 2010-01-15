class CreateTraits < ActiveRecord::Migration
  def self.up
    create_table :traits do |t|
      t.integer :trait_type_id
      t.string :description
      t.integer :relative_id 
      t.timestamps
    end
    add_index :traits, [:relative_id, :trait_type_id]
  end

  def self.down
    drop_table :traits
  end
end
