class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :streetnumber
      t.string :unitnumber
      t.string :street1
      t.string :street2
      t.string :street3
      t.string :locality
      t.string :state
      t.string :county
      t.string :countrycode
      t.string :postcode
      t.integer :relative_id
      t.timestamps
    end
    add_index :addresses, :id
    add_index :addresses, :relative_id
    add_index :addresses, [:countrycode, :streetnumber, :unitnumber]
    add_index :addresses, [:countrycode, :locality, :streetnumber, :unitnumber]
    add_index :addresses, [:countrycode, :postcode]
    add_index :addresses, [:countrycode, :state, :county]
    add_index :addresses, [:countrycode, :county]
  end

  def self.down
    drop_table :addresses
  end
end
