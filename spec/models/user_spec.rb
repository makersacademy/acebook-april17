require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.new(full_name: "My Name", handle: "My Handle", email: "ab@cd.com", password:"123456")
  end

  describe "validity of sign-up details" do
    it "is valid" do
      expect(@user.valid?).to eq(true)
    end

    describe "full_name" do
      it "full name should not be blank" do
        @user.full_name = " "
        expect(@user.valid?).not_to eq(true)
      end

      it "will not be longer than 50 characters" do
        @user.full_name = "a" * 51
        expect(@user.valid?).not_to eq(true)
      end
    end

    describe "handle" do
      it "handle should not be blank" do
        @user.handle = " "
        expect(@user.valid?).not_to eq(true)
      end

      it "will not be longer than 50 characters" do
        @user.handle = "a" * 51
        expect(@user.valid?).not_to eq(true)
      end

      it "will be unique" do
        duplicate_user = User.new(full_name: "My Second Name", handle: "My Handle", email: "Secondab@cd.com", password:"345678")
        @user.save
        expect(duplicate_user.valid?).not_to eq(true)
      end
    end

    describe "email" do
      it "email should not be blank" do
        @user.email = " "
        expect(@user.valid?).not_to eq(true)
      end

      it "will not be longer than 255 characters" do
        @user.email = "a" * 249 + "@bc.com"
        expect(@user.valid?).not_to eq(true)
      end

      it "is in a valid format" do
        @user.email = "abcd.com"
        expect(@user.valid?).not_to eq(true)
      end

      it "will be unique" do
        duplicate_user = User.new(full_name: "My Other Name", handle: "My Other Handle", email: "AB@CD.COM", password:"567890")
        @user.save
        expect(duplicate_user.valid?).not_to eq(true)
      end
    end

    describe "password" do
      it "password should not be blank" do
        @user.password = " "
        expect(@user.valid?).not_to eq(true)
      end

      it "will be no more than 10 characters" do
        @user.password = "12345678910"
        expect(@user.valid?).not_to eq(true)
      end

      it "will be no less than 6 characters" do
        @user.password = "12345"
        expect(@user.valid?).not_to eq(true)
      end

    end

  end

end
