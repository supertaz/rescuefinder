class AddUserIdToAddresses < ActiveRecord::Migration
  def self.up
    add_column :addresses, :addressable_id, :integer
    add_column :addresses, :addressable_type, :string
    add_column :addresses, :address_type_id, :integer
    remove_column :addresses, :relative_id
    add_index :addresses, [:addressable_id, :addressable_type, :address_type_id]
  end

  def self.down
    remove_column :addresses, :addressable_id
    remove_column :addresses, :addressable_type
    remove_column :addresses, :address_type_id
    add_column :addresses, :relative_id, :integer
  end
end
