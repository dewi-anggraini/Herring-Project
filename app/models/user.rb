class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :user_name, presence: true, uniqueness: true
  validates :phone, presence: true

  has_many :posts
  has_many :comments

  def delete_account
    # Anonymize posts
    posts.update_all(user_id: nil, user_name: 'Anonymous') # assuming you have a username field
    destroy
  end
end
