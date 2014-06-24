# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
RibbitApp::Application.config.secret_key_base = '612e1c53c6a2560435fed48d2cc837998fbe4c58f39bfb1923268fe05d12af7edca40d6352cf620739336624286531b0863658579d153adb847155f5f37a9b65'
