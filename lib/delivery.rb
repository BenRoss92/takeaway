require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Delivery

  def initialize(basket)
    account_sid = ENV["ACCOUNT_SID"]
    auth_token = ENV["AUTH_TOKEN"]
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_sms
    @client.messages.create(
      from: ENV["TWILIO_NUMBER"],
      to: ENV["MY_NUMBER"],
      body: "Thank you! Your order was placed and will be delivered before 18:52"
    )
  end

end
