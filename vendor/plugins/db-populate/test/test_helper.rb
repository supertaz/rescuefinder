ENV['RAILS_ENV'] = 'test'

require 'rubygems'
begin
  gem 'test-unit', '~> 2.0'
rescue Gem::LoadError
  require 'test/unit'
end
require 'action_controller'
require 'active_record'
require 'action_view'
require 'mocha'

config = YAML::load(IO.read(File.dirname(__FILE__) + '/database.yml'))

db_adapter = ENV['DB']

# no db passed, try one of these fine config-free DBs before bombing. 
db_adapter ||= begin 
  require 'rubygems' 
  require 'sqlite'
  'sqlite' 
  rescue MissingSourceFile 
    begin 
    require 'sqlite3' 
    'sqlite3' 
    rescue MissingSourceFile 
  end 
end

if db_adapter.nil?
  raise "No DB Adapter selected. Pass the DB= option to pick one, or install Sqlite or Sqlite3." 
end

ActiveRecord::Base.establish_connection(config[db_adapter])

load(File.dirname(__FILE__) + "/schema.rb")

require File.dirname(__FILE__) + '/../init.rb'
