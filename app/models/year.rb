class Year < ApplicationRecord
    validates :year, presence: true, uniqueness: true
  
    def self.current_year
      # This method will return the current year
    end
  
    def self.update_year
      # This method will update the current year to the next year
    end
  end
  