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
https://dev.to/chrissiku/generate-qr-code-with-active-storage-in-ruby-on-rails-7-1m8a

<h4> Some Changer show only customer model  data  </h4>
	<p>qr_data =  "Customer details: name: #{self.name}, age: #{self.age}, address: #{self.address} "
		qrcode = RQRCode::QRCode.new(qr_data)</p>


* ...
