class Customer < ApplicationRecord
	include Rails.application.routes.url_helpers
	has_one_attached :qrcode, dependent: :destroy

	before_commit :generate_qr_code, on: [:create]  

	private
	def generate_qr_code
		# host = Rails.application.config.action_controller.default_url_options[:host]
		# qrcode = RQRCode::QRCode.new(customer_url(self,host:))
		qr_data =  "Customer details: name: #{self.name}, age: #{self.age}, address: #{self.address} "
		qrcode = RQRCode::QRCode.new(qr_data)

		png = qrcode.as_png(
			bit_depth: 1,
			border_modules: 4,
			color_mode: ChunkyPNG::COLOR_GRAYSCALE,
			color: "black",
			file: nil,
			fill: "white",
			module_px_size: 6,
			resize_exactly_to: false,
			resize_gte_to: false,
			size: 120,
			)
		self.qrcode.attach(
			io: StringIO.new(png.to_s),
			filename: "qrcode.png",
			content_type: "image/png",
			)
	end
end
