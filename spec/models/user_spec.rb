require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create(email: "adam@test.com", password: "qwerty", password_confirmation: "qwerty")
  end

  describe "creation" do
    it "can be created" do
      expect(@user).to  be_valid
    end
  end
end


