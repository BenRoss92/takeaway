require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Delivery

  attr_reader :delivery_time

  def initialize(summary)
    account_sid = ENV["ACCOUNT_SID"]
    auth_token = ENV["AUTH_TOKEN"]
    @client = Twilio::REST::Client.new account_sid, auth_token
    @summary = summary
  end

  def send_sms
    @client.messages.create(
      from: ENV["TWILIO_NUMBER"],
      to: ENV["MY_NUMBER"],
      body: "Thank you! Your order was placed and will be delivered before
      #{delivery_time} - #{@summary}"
    )
  end

  private

  def delivery_time
    (Time.new + 3600).strftime("%H:%M")
  end

end
