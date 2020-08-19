require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(email: "polo@dog.com", password_digest: "234", session_token: "4343", password: "polo123") }

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6)}
  end

  describe "#is_password?" do 
    it "should return whether the given password is the actual password" do 
      expect(user.is_password?("polo123")).to be true
    end
    it "should return whether the given password is NOT the actual password" do
      expect(user.is_password?("batmanisthebest")).to be false
    end
  end

  describe "#reset_session_token!" do 
    it "should reset the users session token to a new token" do
      old_token = user.session_token
      new_token = user.reset_session_token!
      expect(new_token).not_to eq(old_token)
    end

    it "should return the user's new session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe "::find_by_credentials" do
    before { user.save! }

    it "should return user if credentials are correct" do
      expect(User.find_by_credentials("polo@dog.com", "polo123")).to eq(user)
    end

    it "should return nil if user credentials are incorrect" do
      expect(User.find_by_credentials("plo@gmail.com", "polo123")).to eq(nil)
    end
  end
end
