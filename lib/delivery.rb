require 'rubygems'
require 'twilio-ruby'

class Delivery

  def initialize
    account_sid = ''
    auth_token = ''
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_sms
    @client.messages.create(
      from: '',
      to: '',
      body: ''
    )
  end

end
