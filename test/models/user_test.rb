require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @request.env["devise.mapping"] = Devise.mappings[:user] 
  end
  # test "the truth" do
  #   assert true
  # end
end
