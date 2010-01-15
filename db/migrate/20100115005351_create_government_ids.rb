class CreateGovernmentIds < ActiveRecord::Migration
  def self.up
    create_table :government_ids do |t|
      t.string :countrycode
      t.string :idtype
      t.string :identifier
      t.integer :relative_id

      t.timestamps
    end
    add_index :government_ids, [:countrycode, :idtype, :identifier, :relative_id], :name => 'by_ccode_idtyp_ident_rid'
    add_index :government_ids, [:relative_id, :countrycode, :idtype, :identifier], :name => 'by_rid_ccode_idtyp_iden'
  end

  def self.down
    drop_table :government_ids
  end
end
