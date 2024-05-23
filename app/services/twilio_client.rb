require 'twilio-ruby'
class TwilioClient
	attr_reader :client

	def initialize
		@client = Twilio::REST::Client.new(ENV["account_sid"], ENV["auth_token"])
	end

#message send method in customer and  
	def send_text(to, body)
		begin
		 message = @client.messages.create(
			from: ENV["phone_number"],
			to: to,
			body: body
			)
		rescue StandardError => e
			puts "An error occurred: #{e.message}"
		end	
	end
#send call on  method in customer and post 
	def send_call(to)
		begin
			call = @client.calls.create(
				from: ENV["phone_number"],
				to: to,
				url: "http://demo.twilio.com/docs/voice.xml")
			puts "Call SID: #{call.sid}"
		rescue Twilio::REST::TwilioError => e
			puts "An error occurred: #{e.message}"
   		puts "Error code: #{e.code}" if e.code 
		end
	end
end
