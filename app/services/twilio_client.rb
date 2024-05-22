require 'twilio-ruby'
class TwilioClient
	attr_reader :client

	def initialize
		@client = Twilio::REST::Client.new(ENV["account_sid"], ENV["auth_token"])
	end


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
end
