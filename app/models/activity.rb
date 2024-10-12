class Activity < ApplicationRecord
    belongs_to :crop
    belongs_to :year
  
    validates :month, presence: true
    validates :activity, presence: true
  
    enum activity: { planting: 0, harvest: 1, mid_season: 2 }
  end
  