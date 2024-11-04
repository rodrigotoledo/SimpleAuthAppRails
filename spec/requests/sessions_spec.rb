require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let(:user) { create(:user, email: "test@example.com", password: "secret", password_confirmation: "secret") }

  describe "GET /new" do
    before do
      create(:user)
    end
    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /login' do
    context 'with valid credentials' do
      it 'creates a session and redirects to home' do
        post login_path, params: {email: user.email, password: 'secret'}
        expect(session[:user_id]).to eq(user.id)
        expect(response).to redirect_to(home_path)
      end
    end

    context 'with invalid credentials' do
      it 'does not create a session and re-renders the login page' do
        post login_path, params: {email: user.email, password: 'wrong_password'}
        expect(session[:user_id]).to be_nil
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'DELETE /logout' do
    before do
      post login_path, params: {email: user.email, password: 'password'}
    end

    it 'destroys the session and redirects to root' do
      delete logout_path
      expect(session[:user_id]).to be_nil
      expect(response).to redirect_to(root_path)
    end
  end
end
