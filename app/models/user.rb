class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :user_name, presence: true, uniqueness: true
  validates :phone, presence: true

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  def anonymize_data
    update(
      user_name: nil,
      email: nil,
      phone: nil,
    )
    comments.update_all(user_name: "Anonymous")
    posts.update_all(user_name: "Anonymous")
  end

end