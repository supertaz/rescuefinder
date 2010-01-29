class AddBodyPartToTraits < ActiveRecord::Migration
  def self.up
    add_column :traits, :body_part_id, :integer
    add_index :traits, [:relative_id, :trait_type_id, :body_part_id], :name => 'traits_rel_type_part_idx'
    add_index :traits, [:trait_type_id, :body_part_id, :relative_id], :name => 'traits_type_part_rel_idx'
  end

  def self.down
    remove_index :traits, [:relative_id, :trait_type_id, :body_part_id]
    remove_index :traits, [:trait_type_id, :body_part_id, :relative_id]
    remove_column :traits, :body_part_id
  end
end
