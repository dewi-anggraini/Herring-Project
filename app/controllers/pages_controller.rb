class PagesController < ApplicationController
  def about
  end

  def contact
    if request.post? # Check if it's a POST request
      name = params[:name]
      email = params[:email]
      message = params[:message]

      puts "Received message from #{name} (#{email}): #{message}"
      
      redirect_to contact_path, notice: "Your message has been received!"
    end
  end
end
