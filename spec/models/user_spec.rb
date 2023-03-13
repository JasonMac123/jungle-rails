require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations for users' do
    it 'user is created if all details are valid' do
      @user = User.create(first_name: 'Jason', last_name: 'Mac', email: 'testing@gmail.com', password: 'password', password_confirmation: 'password')
      expect(@user.save).to eq(true)
    end

    it 'user is not created if email is not unique' do
      @user1 = User.create(first_name: 'Jason', last_name: 'Mac', email: 'testing@gmail.com', password: 'password', password_confirmation: 'password')
      @user2 = User.create(first_name: 'Jason', last_name: 'Mac', email: 'testing@gmail.com', password: 'password', password_confirmation: 'password')
      expect(@user2.save).to eq(false)
    end
    
    it 'user is not created when passwords do not match' do
      @user = User.create(first_name: 'Jason', last_name: 'Mac', email: 'testing@gmail.com', password: 'password', password_confirmation: 'passwords')
      expect(@user.save).to eq(false)
    end

    it 'user is not created when first name is not given' do
      @user = User.create(last_name: 'Mac', email: 'testing@gmail.com', password: 'password', password_confirmation: 'passwords')
      expect(@user.save).to eq(false)
    end

    it 'user is not created when last name is not given' do
      @user = User.create(first_name: 'Jason', email: 'testing@gmail.com', password: 'password', password_confirmation: 'passwords')
      expect(@user.save).to eq(false)
    end

    it 'user is not created when email is not given' do
      @user = User.create(first_name: 'Jason', last_name: 'Mac', password: 'password', password_confirmation: 'passwords')
      expect(@user.save).to eq(false)
    end

    it 'user is not created when password is not given' do
      @user = User.create(first_name: 'Jason', last_name: 'Mac', email: 'testing@gmail.com', password_confirmation: 'passwords')
      expect(@user.save).to eq(false)
    end

    it 'user is not created when confirmation password is not given' do
      @user = User.create(first_name: 'Jason', last_name: 'Mac', email: 'testing@gmail.com', password: 'password')
      expect(@user.save).to eq(false)
    end    

    it 'user is not created if password meet minimum length' do
      @user = User.create(first_name: 'Jason', last_name: 'Mac', email: 'testing@gmail.com', password: 'p', password_confirmation: 'p')
      expect(@user.save).to eq(false)
    end
  end 

  describe '.authenticate_with_credentials' do
    it 'should return user if email and user name are correct' do
      @new_user = User.create(first_name: 'Jason', last_name: 'Mac', email: 'testing@gmail.com', password: 'password', password_confirmation: 'password')
      @user = User.authenticate_with_credentials('testing@gmail.com', 'password')
      expect(@user).not_to be_nil
    end
  
    it 'should return nil if password is wrong' do
      @new_user = User.create(first_name: 'Jason', last_name: 'Mac', email: 'testing@gmail.com', password: 'password', password_confirmation: 'password')
      @user = User.authenticate_with_credentials('testing@gmail.com', '123123123')
      expect(@user).to be_nil
    end

    it 'should return user if there are spaces in the beginner and at the end' do
      @new_user = User.create(first_name: 'Jason', last_name: 'Mac', email: 'testing@gmail.com', password: 'password', password_confirmation: 'password')
      @user = User.authenticate_with_credentials(' testing@gmail.com ', 'password')
      expect(@user).not_to be_nil
    end

    it 'should return user as email is case insensitive' do
      @new_user = User.create(first_name: 'Jason', last_name: 'Mac', email: 'testing@gmail.com', password: 'password', password_confirmation: 'password')
      @user = User.authenticate_with_credentials(' TESTING@gmail.com ', 'password')
      expect(@user).not_to be_nil
    end
  end
end
