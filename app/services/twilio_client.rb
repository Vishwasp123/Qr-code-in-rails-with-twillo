require 'twilio-ruby'
class TwilioClient
	attr_reader :client

	def initialize
   	 debugger
   	 @client = Twilio::REST::Client.new(ENV["account_sid"], ENV["auth_token"])
  	end


	def send_text(customer)
		@cliet.messages.create(
			from: phone_number,
			to: customer.phone_number,
			body:  "Hello, #{customer.name}!"
		)
	end

	private
	def account_sid
		Rails.applicaiton.credentials.twilio[:account_sid]
	end
	def auth_token
		Rails.applicaiton.credentials.twilio[:auth_token]
	end

	def phone_number
		Rails.applicaiton.credentials.twilio[:phone_number]
	end
end
