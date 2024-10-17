require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:existing_post) { FactoryBot.create(:post, user: user) }

  describe "GET /posts" do
    it "returns a list of posts" do
      get posts_path
      expect(response).to have_http_status(302)
    end
  end

  describe "POST /posts" do
    it "saves a new Post" do
      params = { post: { title: "New post", body: "New content.", user_id: user.id } }
      expect {
        post posts_path, params: { post: params }
      }.to change(Post, :count).by(1)

     expect(response).to redirect_to(post_path(Post.last))
  #  end
    #it "creates a new post" do
    #  post_attributes = FactoryBot.attributes_for(:post)
    #  expect {  post posts_path, params: {post: post_attributes} 
    #}.to change(Post.count).by(1)
      #post posts_path, params: { post: { title: "New post", body: "New content.", user_id: user.id } }
    #  expect(response).to have_http_status(201)
    #  expect(Post.last.title).to eq("New Post")
    end
  end

  describe "get edit_post_path" do
    it "edit existing post" do
      get edit_post_path(id: existing_post.id)
      expect(response).to have_http_status(302)
    end  
  end

  describe "PATCH /posts/:id" do
    it "updates an existing post" do
      patch post_path(existing_post), params: { post: { title: "Updated Title" } }
      existing_post.reload
      expect(response).to have_http_status(302)
    end
  end

  describe "delete a post record" do
    it "deletes a post record" do
      delete post_path(existing_post)
      expect(response).to have_http_status(302)
    end
  end

  #describe "GET /posts" do
  #  it "works! (now write some real specs)" do
  #    get posts_index_path
  #   expect(response).to have_http_status(200)
  #  end
  #end
end
