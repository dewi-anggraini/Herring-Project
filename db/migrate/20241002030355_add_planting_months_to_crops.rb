class AddPlantingMonthsToCrops < ActiveRecord::Migration[7.1]
  def change
    add_column :crops, :planting_months, :string
    add_column :crops, :year, :integer
    add_column :crops, :activity, :string
  end
end
