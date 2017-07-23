require 'twilio-ruby'

class PagesController < ApplicationController
  def home
  end
  def sms
    #raise "Action sms in the UsersController is not implemented! received params #{params.to_json}"
    #byebug
    puts params["phone"];
    puts params["text"];
    @phone = params["phone"];
    @text = params["text"];
    account_sid = "ACb6b3ceafd02250aab730da69d3788942";
    auth_token = "75135711a30a39ae058b84a341162be9";
    twilio_no = "+15087147386";
    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
      body: @text,
      to: @phone,    # Replace with your phone number
      from: twilio_no)  # Replace with your Twilio number
    puts message.sid
  end
end
