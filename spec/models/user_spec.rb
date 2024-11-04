require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it 'is invalid with a duplicate email' do
    create(:user, email: "duplicate@example.com")
    user = build(:user, email: "duplicate@example.com")
    expect(user).not_to be_valid
    expect(user.errors[:email]).not_to be_empty
  end

  context "validation of password" do
    it 'is invalid without a password' do
      user = build(:user, password: nil)
      expect(user).not_to be_valid
      expect(user.errors[:password]).not_to be_empty
    end

    it 'is invalid if password confirmation does not match' do
      user = FactoryBot.build(:user, password: 'password', password_confirmation: 'different_password')
      expect(user).not_to be_valid
      expect(user.errors[:password_confirmation]).not_to be_empty
    end
  end
end
