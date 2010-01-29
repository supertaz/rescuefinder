class Relative < ActiveRecord::Base

  belongs_to :user, :counter_cache => :relative_count, :touch => :missing_last_updated_at

  has_many :addresses, :as => :addressable, :dependent => :destroy
  has_many :phone_numbers, :as => :phoneable, :dependent => :destroy
  has_many :government_ids, :dependent => :destroy
  has_many :traits, :dependent => :destroy

  accepts_nested_attributes_for :addresses, :allow_destroy => true
  accepts_nested_attributes_for :phone_numbers, :allow_destroy => true
  accepts_nested_attributes_for :government_ids, :allow_destroy => true
  accepts_nested_attributes_for :traits, :allow_destroy => true

  has_attached_file :photo,
                    :styles => {
                            :thumb => '64x64>',
                            :small => '150x150>',
                            :medium => '250x250',
                            :large => '400x400',
                            :huge => '800x800'
                    }

  attr_accessible :givenname, :familyname, :age, :birthdate, :height, :height_unit, :student, :occupation, :employer_or_school

  validates_presence_of       :givenname, :familyname
  validates_length_of         :givenname, :familyname, :within => 2..64
  validates_presence_of       :height_unit, :unless => Proc.new {|relative| relative.height.blank? || relative.height == 0}
end
