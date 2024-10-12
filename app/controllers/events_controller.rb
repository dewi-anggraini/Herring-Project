class EventsController < ApplicationController

    def index
      Rails.logger.debug "Current month: #{Time.current.month}"
      @crops = Crop.get_crops_by_month(Time.current.month)
    end

    def update_year
      Year.update_year
      redirect_to root_path
    end
end
  

  