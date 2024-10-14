class Crop < ApplicationRecord
    validates :name, presence: true
    validates :planting_months, presence: true
    validates :harvest_months, presence: true
    validates :mid_season_months, presence: true
  
    def self.get_crops_by_month(month)
        where("planting_months LIKE ? OR harvest_months LIKE ? OR mid_season_months LIKE ?", "%#{month}%", "%#{month}%", "%#{month}%")
       # where("planting_months @> ? OR harvesting_months @> ? OR mid_season_months @> ?", month, month, month), this one not working
    end
end
  