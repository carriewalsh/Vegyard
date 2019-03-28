require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :password}
    it {should validate_presence_of :email_address}
    it {should validate_uniqueness_of :name}
    it {should validate_uniqueness_of :email_address}
    it {should validate_length_of :password}
  end

  describe ".authenticate" do
    it "should check for email/password correctness" do
      user = User.create(name: "Corey Sheesley", email_address: "corey@gmail.com", password: "abcd1234")
      expect(User.authenticate(user.email_address, user.password)).to eq(user)
      expect(User.authenticate("carrie@gmail.com", "asdfasd")).to eq(nil)

    end
  end


end
