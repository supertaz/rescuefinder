class AddUserIdToAddresses < ActiveRecord::Migration
  def self.up
    add_column :addresses, :user_id, :integer
    add_column :addresses, :addresstype, :string
    add_index :addresses, [:user_id, :addresstype]
    add_index :addresses, [:relative_id, :addresstype]
  end

  def self.down
    remove_column :addresses, :user_id
  end
end
