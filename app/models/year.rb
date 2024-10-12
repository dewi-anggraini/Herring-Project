class Year < ApplicationRecord
    validates :year, presence: true, uniqueness: true
  
    def self.current_year
      # to return the current year
    end
  
    def self.update_year
      # to update the current year to the next year when the current year has ended
    end
  end
  