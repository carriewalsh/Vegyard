class Plant < ApplicationRecord
  has_many :plant_gardens
  has_many :gardens, through: :plant_gardens

  validates_presence_of :name, :days, :distance, :sun
end
