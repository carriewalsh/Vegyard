require "rails_helper"

RSpec.describe Plant, type: :model do
  describe "relationships" do
    it {should have_many :plant_gardens}
    it {should have_many :gardens}
  end

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :days}
    it {should validate_presence_of :distance}
    it {should validate_presence_of :sun}
  end
end
