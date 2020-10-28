class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :good_thing

  with_options presence: true do
    validates :nickname, :password_confirmation
    validates :email, uniqueness: true
    validates :email, exclusion: { in: ['@'] }
    validates :password, length: { minimum: 6 }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  end
end
