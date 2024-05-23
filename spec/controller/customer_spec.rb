require 'rails_helper'

RSpec.describe CustomersController, type: :controller do

  let!(:customer) {FactoryBot.create(:customer)}
  let(:valid_params) { {customer: {name: "Vishwas", age: 18, address:"Indore", phone_number: 7418529637 } } }


  describe "GET /index" do
    it "return all succeesful response" do 
      get :index 
      expect(response).to be_successful
    end
  end

  describe "Get /create" do  
    context "Create new Customer" do 
      it "create customer and redirect to customers_path"do 
        post :create, params: valid_params 
       expect(response).to redirect_to(customers_path)
      end 
    end
  end

  describe "Get /show" do 
   context "when showing a user's details" do 
      it "returns the user's details" do
        get :show, params: { id: customer.id }
        expect(response).to be_successful
        # Optionally, you can check for specific content in the response
        # expect(response.body).to include(customer.name)
      end
    end
  end

  describe "PUT/ update"do 
    context " Updte customer details" do
      it "We want update the user details"do
       put :update, params: {id: customer.id, customer: {name: "Xyz"} }
       customer.reload
       expect(response).to redirect_to(customer_path(customer))
       expect(flash[:notice]).to eq("Customer was successfully updated.")
      end
    end
  end

  describe"Delete / destroy" do 
    context "Destroy Customer Details" do 
      it "destroy customer details" do 
        delete :destroy, params: { id: customer.id }
        expect(response).to redirect_to(customers_path)
        expect(flash[:notice]).to eq("Customer was successfully destroyed.") 
      end
    end
  end
end

