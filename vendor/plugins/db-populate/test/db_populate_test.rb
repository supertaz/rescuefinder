require File.dirname(__FILE__) + '/test_helper.rb'
require 'test/unit'
require 'rubygems'
require 'mocha'

class User < ActiveRecord::Base
  attr_accessible :name
end

class Customer < ActiveRecord::Base
  set_primary_key "cust_id"
  validates_length_of :name, :minimum => 4
end

class DbPopulateTest < Test::Unit::TestCase
  
  def test_creates_new_record
    User.delete_all
    User.create_or_update(:id => 1, :name => "Fred")
    assert_equal 1, User.count
    u = User.find(:first)
    assert_equal "Fred", u.name
  end
  
  def test_updates_existing_record
    User.delete_all
    User.create_or_update(:id => 1, :name => "Fred")
    User.create_or_update(:id => 1, :name => "George")
    assert_equal 1, User.count
    u = User.find(:first)
    assert_equal "George", u.name
  end
  
  def test_creates_new_record_with_nonstandard_pk
    Customer.delete_all
    Customer.create_or_update(:cust_id => 1, :name => "Fred")
    assert_equal 1, Customer.count
    c = Customer.find(:first)
    assert_equal "Fred", c.name
  end
  
  def test_creates_new_record_respects_attr_accessible
    ActiveRecord::Base.logger = ActiveSupport::BufferedLogger.new(STDERR)
    User.delete_all
    ActiveRecord::Base.expects(:log_protected_attribute_removal)
    User.create_or_update(:id => 1, :name => "Fred", :admin => true)
    u = User.find(:first)
    assert_equal false, u.admin
  end
  
  def test_creates_new_record_skipping_attr_accessible
    User.delete_all
    ActiveRecord::Base.expects(:log_protected_attribute_removal).never
    User.create_or_update(:id => 1, :name => "Fred", :admin => true, :perform_validations => false)
    assert_equal 1, User.count
    u = User.find(:first)
    assert_equal "Fred", u.name
    assert_equal true, u.admin
  end
  
  def test_updates_existing_record
    Customer.delete_all
    Customer.create_or_update(:cust_id => 1, :name => "Fred")
    Customer.create_or_update(:cust_id => 1, :name => "George")
    assert_equal 1, Customer.count
    c = Customer.find(:first)
    assert_equal "George", c.name
  end
  
  def test_creates_new_record_respects_validation
    Customer.delete_all
    assert_raise ActiveRecord::RecordInvalid do
      Customer.create_or_update(:cust_id => 1, :name => "Me")
    end
    assert_equal 0, Customer.count
  end
  
  def test_creates_new_record_without_validation
    Customer.delete_all
    Customer.create_or_update(:cust_id => 1, :name => "Me", :perform_validations => false)
    assert_equal 1, Customer.count
    c = Customer.find(:first)
    assert_equal "Me", c.name
  end
  
end

