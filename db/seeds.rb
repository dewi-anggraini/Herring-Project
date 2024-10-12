# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Crop.create(name: 'Rice', planting_months: [11, 12, 1, 2, 3], harvest_months: [4, 5, 6], mid_season_months: [7, 8, 9, 10])
Crop.create(name: 'Corn', planting_months: [4, 5, 6, 7], harvest_months: [8, 9, 10], mid_season_months: [11, 12])
Crop.create(name: 'Soybean', planting_months: [4, 5, 7, 8], harvest_months: [6, 9], mid_season_months: [1, 2, 3, 10, 11, 12])
Crop.create(name: 'Chili', planting_months: [3, 4, 5, 6], harvest_months: [7, 8, 9], mid_season_months: [1, 2, 10, 11, 12])
Crop.create(name: 'Shallot', planting_months: [4, 5, 7, 8], harvest_months: [6, 9], mid_season_months: [1, 2, 3, 10, 11, 12])
Crop.create(name: 'Garlic', planting_months: [4, 5, 7, 8], harvest_months: [6, 9], mid_season_months: [1, 2, 3, 10, 11, 12])
Crop.create(name: 'Potato', planting_months: [4, 5, 6, 7], harvest_months: [8], mid_season_months: [1, 2, 3, 9, 10, 11, 12])
Year.create(year: Time.current.year)

