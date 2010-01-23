class AddActiveFieldToRelatives < ActiveRecord::Migration
  def self.up
    add_column :relatives, :active, :boolean, :null => false, :default => true
    add_index :relatives, [:id, :familyname, :givenname, :active]
    add_index :relatives, [:active, :familyname, :givenname, :age, :id]
    add_index :relatives, [:active, :employer_or_school, :givenname, :familyname, :id], :name => 'by_act_emp_gname_fname_id'
    remove_index :relatives, [:id, :familyname, :givenname]
  end

  def self.down
    remove_index :relatives, :name => 'by_act_emp_gname_fname_id'
    remove_index :relatives, [:id, :familyname, :givenname, :active]
    remove_index :relatives, [:active, :familyname, :givenname, :age, :id]
    remove_column :relatives, :active
    add_index :relatives, [:id, :familyname, :givenname]
  end
end
