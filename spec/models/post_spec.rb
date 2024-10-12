require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { FactoryBot.create(:user) }
  it { expect(Post.reflect_on_association(:comments)).to be_present }

  it "is valid with valid attributes" do
    post = Post.new(user: user, title: "Sample Title", body: "Sample body.")
    expect(post).to be_valid
  end

  it "is not valid without title" do
    post = Post.new(title: nil)
    expect(post).to_not be_valid
  end

  it "is not valid without body" do
    post = Post.new(body: nil)
    expect(post).to_not be_valid
  end

  #pending "add some examples to (or delete) #{__FILE__}"
end
