class Garden < ApplicationRecord
  has_many :plant_gardens
  has_many :plants, through: :plant_gardens

  validates_presence_of :owner, :planters, :sun
end
