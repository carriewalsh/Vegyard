class PlantGarden < ApplicationRecord
  belongs_to :plant
  belongs_to :garden
end
