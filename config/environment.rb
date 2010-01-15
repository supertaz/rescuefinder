RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

AUTHORIZATION_MIXIN = "object roles"

# NOTE : If you use modular controllers like '/admin/products' be sure
# to redirect to something like '/sessions' controller (with a leading slash)
# as shown in the example below or you will not get redirected properly
#
# This can be set to a hash or to an explicit path like '/login'
#
LOGIN_REQUIRED_REDIRECTION = { :controller => '/sessions', :action => 'new' }
PERMISSION_DENIED_REDIRECTION = { :controller => '/home', :action => 'index' }

# The method your auth scheme uses to store the location to redirect back to
STORE_LOCATION_METHOD = :store_location

Rails::Initializer.run do |config|

  config.gem 'mislav-will_paginate', :lib => 'will_paginate', :version => '>=2.3.11'
  config.gem 'authlogic', :version => '>=2.1.2'
  config.gem 'paperclip'

  config.time_zone = 'UTC'

  config.active_record.observers = :user_observer

end
