require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(user_name: "Jack Smith", phone: "8889995678", email: "jsmith@sample.com", password: "jsmith")}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  
  it "is not valid without a user_name" do
    subject.user_name=nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a phone number" do
    subject.phone=nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an email" do
    subject.email=nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a password" do
    subject.password=nil
    expect(subject).to_not be_valid
  end
    
    
  #pending "add some examples to (or delete) #{__FILE__}"
end
