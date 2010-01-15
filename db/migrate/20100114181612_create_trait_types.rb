class CreateTraitTypes < ActiveRecord::Migration
  def self.up
    create_table :trait_types do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
    add_index :trait_types, :id
  end

  def self.down
    drop_table :trait_types
  end
end
