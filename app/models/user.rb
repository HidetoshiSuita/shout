class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
<<<<<<< HEAD

  validates :name, presence: true, length: { maximum: 50 }

=======
>>>>>>> a387064bf2cbbc7c395db7f6049cd2b21a47f9f4
end
