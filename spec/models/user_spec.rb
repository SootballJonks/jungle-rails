require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do

    it "should create a valid user" do
      user = User.create(
        first_name: "Solaire",
        last_name: "Astora",
        email: "praisethesun@123.com",
        password: "sunbro69",
        password_confirmation: "sunbro69"
      )
      expect(user).to (be_valid)
    end

    it "should fail if either password field is missing" do
      user1 = User.create(
        first_name: "Solaire",
        last_name: "Astora",
        email: "praisethesun@123.com",
        password: "sunbro69",
      )
      user2 = User.create(
        first_name: "Solaire",
        last_name: "Astora",
        email: "praisethesun@123.com",
        password_confirmation: "sunbro69"
      )
      expect(user1).to_not (be_valid)
      expect(user2).to_not (be_valid)
    end

    it "should pass when passwords match" do
      user = User.create(
        first_name: "Solaire",
        last_name: "Astora",
        email: "praisethesun@123.com",
        password: "sunbro69",
        password_confirmation: "sunbro"
      )
      expect(user).to_not (be_valid)
    end

    it "should check for existing email" do
      user1 = User.create(
        first_name: "Solaire",
        last_name: "Astora",
        email: "praisethesun@123.com",
        password: "sunbro69",
        password_confirmation: "sunbro69"
      )
      user2 = User.create(
        first_name: "Solaire",
        last_name: "Astora",
        email: "praisethesun@123.com",
        password: "sunbro69",
        password_confirmation: "sunbro69"
      )
      expect(user2).to_not (be_valid)
    end

    it "should check password length" do
      user = User.create(
        first_name: "Solaire",
        last_name: "Astora",
        email: "praisethesun@123.com",
        password: "69",
        password_confirmation: "69"
      )
      expect(user).to_not (be_valid)
    end
  end

  describe ".authenticate_with_credentials" do
    it "should authenticate using class method" do
      user = User.create(
        first_name: "Solaire",
        last_name: "Astora",
        email: "praisethesun@123.com",
        password: "sunbro69",
        password_confirmation: "sunbro69"
      )
      authenticate = User.authenticate_with_credentials(user.email, user.password)
      expect(authenticate).to (be_truthy)
    end
  end

end
