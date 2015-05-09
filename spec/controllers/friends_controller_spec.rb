require 'rails_helper'

RSpec.describe FriendsController, type: :controller do
  let(:valid_attributes) do
    skip("Add a hash of attributes valid for your model")
  end

  let(:invalid_attributes) do
    skip("Add a hash of attributes invalid for your model")
  end

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all friends as @friends" do
      friend = Friend.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:friends)).to eq([friend])
    end
  end

  describe "GET #show" do
    it "assigns the requested friend as @friend" do
      friend = Friend.create! valid_attributes
      get :show, { id: friend.to_param }, valid_session
      expect(assigns(:friend)).to eq(friend)
    end
  end
end
