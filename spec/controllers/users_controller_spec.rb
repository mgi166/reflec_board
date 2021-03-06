require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) do
    attributes_for :user
  end

  let(:invalid_attributes) do
    attributes_for :user, :blank_name_and_email
  end

  let(:valid_session) { {} }

  describe "GET #show" do
    let(:user) { User.create! valid_attributes }

    context 'user is not logged in' do
      subject { get :show, { id: user.to_param }, valid_session }
      include_examples 'redirects to login url'
    end

    context 'user is already logged in' do
      before do
        login user
      end

      it "assigns the requested user as @user" do
        get :show, { id: user.to_param }, valid_session
        expect(assigns(:user)).to eq(user)
      end
    end
  end

  describe "GET #new" do
    it "assigns a new user as @user" do
      get :new, {}, valid_session
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "GET #edit" do
    let(:user) { User.create! valid_attributes }

    context 'user is not logged in' do
      subject { get :edit, { id: user.to_param }, valid_session }
      include_examples 'redirects to login url'
    end

    context 'user is already logged in' do
      before do
        login user
      end

      it "assigns the requested user as @user" do
        get :edit, { id: user.to_param }, valid_session
        expect(assigns(:user)).to eq(user)
      end
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new User" do
        expect do
          post :create, { user: valid_attributes }, valid_session
        end.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, { user: valid_attributes }, valid_session
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it "redirects to the created user" do
        post :create, { user: valid_attributes }, valid_session
        expect(response).to redirect_to(User.last)
        expect(flash[:notice]).to eq '新規ユーザーを作成しました'
      end

      context 'unique constraint violation' do
        before do
          allow_any_instance_of(User).to receive(:save!).and_raise(ActiveRecord::RecordNotUnique, 'test')
        end

        it do
          post :create, { user: valid_attributes }, valid_session
          expect(response).to render_template :new
        end

        it do
          expect do
            post :create, { user: valid_attributes }, valid_session
          end.not_to change(User, :count)
        end
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        post :create, { user: invalid_attributes }, valid_session
        expect(assigns(:user)).to be_a_new(User)
      end

      it "re-renders the 'new' template" do
        post :create, { user: invalid_attributes }, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    let(:user) { User.create! valid_attributes }
    let(:new_attributes) do
      attributes_for(:user).merge(username: 'new_name')
    end

    context 'user is not logged in' do
      subject { put :update, { id: user.to_param, user: new_attributes }, valid_session }
      include_examples 'redirects to login url'
    end

    context 'user is already logged in' do
      before do
        login user
      end

      context "with valid params" do
        it "updates the requested user" do
          put :update, { id: user.to_param, user: new_attributes }, valid_session
          user.reload
          expect(user.username).to eq('new_name')
        end

        it "assigns the requested user as @user" do
          put :update, { id: user.to_param, user: valid_attributes }, valid_session
          expect(assigns(:user)).to eq(user)
        end

        it "redirects to the user" do
          put :update, { id: user.to_param, user: valid_attributes }, valid_session
          expect(response).to redirect_to(user)
          expect(flash[:notice]).to eq 'ユーザー設定を更新しました'
        end
      end

      context "with invalid params" do
        it "assigns the user as @user" do
          put :update, { id: user.to_param, user: invalid_attributes }, valid_session
          expect(assigns(:user)).to eq(user)
        end

        it "re-renders the 'edit' template" do
          put :update, { id: user.to_param, user: invalid_attributes }, valid_session
          expect(response).to render_template("edit")
        end
      end
    end
  end

  describe "DELETE #destroy" do
    let(:user) { User.create! valid_attributes }

    context 'user is not logged in' do
      subject { delete :destroy, { id: user.to_param }, valid_session }
      include_examples 'redirects to login url'
    end

    context 'user is already logged in' do
      before do
        login user
      end

      it "destroys the requested user" do
        expect do
          delete :destroy, { id: user.to_param }, valid_session
        end.to change(User, :count).by(-1)
      end

      it "redirects to the users list" do
        delete :destroy, { id: user.to_param }, valid_session
        expect(response).to redirect_to(users_url)
        expect(flash[:notice]).to eq 'ユーザーを削除しました'
      end
    end
  end
end
