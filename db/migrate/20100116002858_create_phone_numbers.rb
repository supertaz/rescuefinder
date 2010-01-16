class CreatePhoneNumbers < ActiveRecord::Migration
  def self.up
    create_table :phone_numbers do |t|
      t.integer :phonetype_id
      t.string :phonenumber
      t.integer :phoneable_id
      t.string :phoneable_type

      t.timestamps
    end
  end

  def self.down
    drop_table :phone_numbers
  end
end
