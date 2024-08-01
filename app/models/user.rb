class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :missions
  has_many :levels, dependent: :destroy
  has_many :comments

  validates :email,              presence: true
  validates :encrypted_password, presence: true, length: { minimum: 6 }
  validates :name,               presence: true

end