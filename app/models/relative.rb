class Relative < ActiveRecord::Base

  belongs_to :user

  has_many :addresses, :as => :addressable, :dependent => :destroy
  has_many :phone_numbers, :as => :phoneable, :dependent => :destroy
  has_many :government_ids
  has_many :traits

  has_attached_file :photo,
                    :styles => {
                            :thumb => '64x64>',
                            :small => '150x150>',
                            :medium => '250x250',
                            :large => '400x400',
                            :huge => '800x800'
                    }

  attr_accessible :givenname, :familyname, :age, :birthdate, :student, :occupation, :employer_or_school, :photo_file_name, :photo_content_type, :photo_file_size

end
