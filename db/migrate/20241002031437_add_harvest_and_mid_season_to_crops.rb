class AddHarvestAndMidSeasonToCrops < ActiveRecord::Migration[7.1]
  def change
    add_column :crops, :harvest_months, :string
    add_column :crops, :mid_season_months, :string
  end
end
