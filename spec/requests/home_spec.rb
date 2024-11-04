require 'rails_helper'

RSpec.describe "Home", type: :request do
  let(:user) { create(:user) }

  describe 'GET /home' do
    context 'when user is authenticated' do
      before do
        post login_path, params: {email: user.email, password: 'password'}
      end

      it 'returns a successful response' do
        get home_path
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when user is not authenticated' do
      it 'redirects to the login page' do
        get home_path
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
