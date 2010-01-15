class CreateRelatives < ActiveRecord::Migration
  def self.up
    create_table :relatives do |t|
      t.integer :user_id
      t.string :givenname
      t.string :familyname
      t.integer :age
      t.integer :height
      t.string :height_unit
      t.datetime :birthdate
      t.boolean :student
      t.string :occupation
      t.string :employer_or_school
      t.text :description
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.datetime :photo_updated_at
      t.timestamps
    end
    add_index :relatives, [:id, :familyname, :givenname]
    add_index :relatives, [:familyname, :givenname, :age, :id]
    add_index :relatives, [:employer_or_school, :givenname, :familyname, :id], :name => 'by_emp_gname_fname_id'
  end
  
  def self.down
    drop_table :relatives
  end
end
