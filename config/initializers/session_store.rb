# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_n3_session',
  :secret      => '0c82ee04e14c75739b9430e29700d0e5751f5235874003c2ba23f7f9c46778322cfe23bb90ae2b3e98d9aa91ee55279a83f7b4b3b40e376aa94c699a0561850f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
