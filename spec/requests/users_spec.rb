require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "User Registration" do
    it "allows a user to sign up" do
      post user_registration_path, params: {
        user: {
          user_name: "test",
          phone: "1234567",
          email: "testing@sample.com",
          password: "password",
          password_confirmation: "password"
        }
      }
      expect(response).to redirect_to(root_path)
    end
  end

  describe "User Sign In" do
    before do
      @user = FactoryBot.create(:user) 
    end

    it "allows a user to sign in" do
      post user_session_path, params: {
        user: {
          email: @user.email,
          password: @user.password
        }
      }
      expect(response).to redirect_to(root_path)
    end
  end

  describe "User Sign Out" do
    let(:user) { FactoryBot.create(:user) } 

    before do
      post user_session_path, params: {
        user: {
          email: user.email,
          password: user.password
        }
      }
    end
    it "allows a user to sign out" do
      delete destroy_user_session_path
      expect(response).to redirect_to(root_path)
    end
  end



  #describe "GET /users" do
  #  it "works! (now write some real specs)" do
  #    get users_index_path
  #    expect(response).to have_http_status(200)
  #  end
  #end
end
