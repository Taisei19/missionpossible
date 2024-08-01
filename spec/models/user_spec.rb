require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'nameなしでは登録できない' do
      user = User.new(name: nil, email: 'test@example.com', encrypted_password: 'password123')
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'emailなしでは登録できない' do
      user = User.new(name: 'Test User', email: nil, encrypted_password: 'password123')
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'パスワードなしでは登録できない' do
      user = User.new(name: 'Test User', email: 'test@example.com', encrypted_password: nil)
      expect(user).not_to be_valid
      expect(user.errors[:encrypted_password]).to include("can't be blank")
    end

    it 'パスワードが５文字以下では登録できない' do
      user = User.new(name: 'Test User', email: 'test@example.com', encrypted_password: 'short')
      expect(user).not_to be_valid
      expect(user.errors[:encrypted_password]).to include('is too short (minimum is 6 characters)')
    end
  end
end