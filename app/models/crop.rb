class Crop < ApplicationRecord
    validates :name, :planting_months, :harvest_months, :mid_season_months, presence: true
  
    def self.get_crops_by_month(month)
        where("planting_months LIKE ? OR harvest_months LIKE ? OR mid_season_months LIKE ?", "%#{month}%", "%#{month}%", "%#{month}%")
    end
end
  