# frozen_string_literal: true

@client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['API_Key']
  config.consumer_secret     = ENV['API_Secret']
  config.access_token        = ENV['Access_Token']
  config.access_token_secret = ENV['Access_Token_Secret']
end
