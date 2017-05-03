ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

require 'twilio-ruby'

account_sid = "AC8fd90c3e5ee9217401284ddbd9b0d1d0" # Your Account SID from www.twilio.com/console
auth_token = "{{ fe99363a134cb89b8687e5aa0c9a0562 }}"   # Your Auth Token from www.twilio.com/console

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.account.messages.create(:body => "Hello from Ruby",
    :to => "+59160346031",    # Replace with your phone number
    :from => "+12053907039")  # Replace with your Twilio number

puts message.sid