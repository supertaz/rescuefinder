class CreatePhonetypes < ActiveRecord::Migration
  def self.up
    create_table :phonetypes do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :phonetypes
  end
end
