# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_metafields_session',
  :secret      => 'ef1ed65664f63e9e4b9e613e219f83edb2b38cb4c377130f15e5e3fb2277a7721184e5e71fa441de8d9aae26aaab94ff28a655f96b4943762a138caf14db5fe9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
