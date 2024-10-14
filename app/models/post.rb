class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  
  before_destroy :delete_associated_comments
  validates :title, :body, presence: true

  private

  def delete_associated_comments
    comments.destroy_all
  end
end
