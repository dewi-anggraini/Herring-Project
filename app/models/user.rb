class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :user_name, presence: true, uniqueness: true
  validates :phone, presence: true

  has_many :posts
  has_many :comments
end
