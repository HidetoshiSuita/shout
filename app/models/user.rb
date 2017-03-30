class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :follow_lists, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  
  has_many :user_genres
  has_many :genres, through: :user_genres
  has_many :articles

end
