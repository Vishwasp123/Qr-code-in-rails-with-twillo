require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  before do 
    @post = FactoryBot.create(:post)
  end

  describe "GET /index" do
    context "return all the succefull response" do
      it "give @customers.all " do 
       get :index
       byebug 
       expect(response).to be_successful 
      end 
    end
  end

  describe "post / post create"do 
    context "Create a post request"do
      it "Create post " do  
        # post_params = FactoryBot.attributes_for(:post)
        post :create, params: { post: {title: "title", body:"Body"} }
        expect(response).not_to be_successful
     end
    end
  end

  describe "Get / show" do 
    context"show Create post" do 
      it "Show post details" do  
        get :show, params: {id: @post.id}
        expect(response).to be_successful
      end
    end
  end

  describe "Get/ update" do 
    context "update post detials" do 
      it "update detials" do 
        put :update, params: {id: @post.id, post: {title: "Xyz"} }
        @post.reload
        expect(flash[:notice]).to eq("Post was successfully updated.")
      end
    end
  end

  describe "Delete/ post" do 
    context"Delete post data" do
      it "Delete post data" do 
      delete :destroy, params: {id: @post.id} 
      expect(flash[:notice]).to eq("Post was successfully destroyed.")
      end
    end
  end
end
