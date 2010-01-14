# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rescuefinder_session',
  :secret      => 'a648b419315c85a78eef4128f041e09c29dabb83d427078bc94927771a9e30f5dcfabcd9b1b9da94d07dc693bef4cbec9b30f229d69572efc4ff3d42a4e21aa1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
