class AddUserstateToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :userstate, :string
    add_column :users, :active, :boolean, :null => false, :default => true
    add_column :users, :relative_count, :integer
    add_column :users, :found_count, :integer
    add_column :users, :update_count, :integer
    add_column :users, :message_count, :integer
    add_column :users, :unread_count, :integer
    add_column :users, :missing_last_updated_at, :datetime
  end

  def self.down
    remove_column :users, :userstate
    remove_column :users, :active
    remove_column :users, :relative_count
    remove_column :users, :found_count
    remove_column :users, :update_count
    remove_column :users, :message_count
    remove_column :users, :unread_count
    remove_column :users, :missing_last_updated_at
  end
end
