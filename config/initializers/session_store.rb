# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_book_store_session',
  :secret      => 'e19ffae26b33befb0f6159d09f850021c00b83bdd17e91fb3bf9c647d57c9423cc4b76c27b47e43a9ba8cc985fc2dd8ac7eb10344dde441b33c0c67a0a2418bf'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
