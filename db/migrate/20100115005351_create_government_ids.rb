class CreateGovernmentIds < ActiveRecord::Migration
  def self.up
    create_table :government_ids do |t|
      t.string :countrycode
      t.string :idtype
      t.string :identifier
      t.integer :relative_id

      t.timestamps
    end
    add_index :government_ids, [:countrycode, :idtype, :identifier, :relative_id]
    add_index :government_ids, [:relative_id, :countrycode, :idtype, :identifier]
  end

  def self.down
    drop_table :government_ids
  end
end
