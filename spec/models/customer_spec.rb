require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:customer) {create(:customer)}
  let(:valid_attributes) {{name: "Vishwas", address: "Indore", age: 18, phone_number: +917649040881}}

  describe "association" do 
   it { should have_one_attached(:qrcode) }
 end

 describe 'before_commit callback' do
    context 'when creating a new customer' do
      let(:customer) { build(:customer) }
      it 'generates a QR code' do
        expect(customer.qrcode.attached?).to be_falsy
        customer.save!
        expect(customer.qrcode.attached?).to be_truthy
      end
    end

    context 'when updating an existing customer' do
      let(:customer) { create(:customer) }

      it 'does not generate a new QR code' do
        original_qrcode = customer.qrcode.download
        customer.update(valid_attributes)
        expect(customer.qrcode.download).to eq(original_qrcode)
      end
    end
  end
end 

