# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

Blog: url:
qr code genrate 
https://dev.to/chrissiku/generate-qr-code-with-active-storage-in-ruby-on-rails-7-1m8a


<h4> Some Changer show only customer model  data  </h4>
<p>qr_data =  "Customer details: name: #{self.name}, age: #{self.age}, address: #{self.address} "
qrcode = RQRCode::QRCode.new(qr_data)
add gem 
gem "rqrcode"
add gem for twillo impelmation 
gem 'twilio-ruby'</p>


<h3> Twillo impelnation</h3>
<p>Blog:-
https://austinbuhler.medium.com/sending-sms-messages-in-ruby-on-rails-with-twilio-f9c90d897c15</p>

i create .env file and add credentials in env
and create serivices/twillo_client.rb
in this file write twillo code
and add method in customer create 
action 
 @customer.save
      twilio_client = TwilioClient.new
      twilio_client.send_text(customer_params["phone_number"], "Hello, #{@customer.name}")
      redirect_to customers_path, notice: "Customer was successfully created."

      ex:- phone number must be started +9176490....



* ...
