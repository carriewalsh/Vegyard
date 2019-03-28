require "rails_helper"

RSpec.describe Garden, type: :model do
  describe "relationships" do
    it {should have_many :plant_gardens}
    it {should have_many :plants}
  end

  describe "validations" do
    it {should validate_presence_of :owner}
    it {should validate_presence_of :planters}
    it {should validate_presence_of :sun}
  end
end
