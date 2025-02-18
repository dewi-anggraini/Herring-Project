class PagesController < ApplicationController
  def about
  end

  def contact
    if request.post? 
      #add strong params here
      contact_params = params.require(:contact).permit(:name, :email, :message) 

    # this is contact params instead of params directly
      name = params[:name]
      email = params[:email]
      message = params[:message]

      puts "Received message from #{name} (#{email}): #{message}"
      
      redirect_to contact_path, notice: "Your message has been sent!"
    else
      flash.now[:alert] = "There was an issue sending your message."
      render :contact
    end
  end

  private

  def send_contact_email(name, email, message)
    ContactMailer.send_contact_email(name, email, message).deliver_now
  end
end
