class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :missions
  has_many :levels, dependent: :destroy
  has_many :comments

  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }

  validate :email_must_contain_at

  private

  def email_must_contain_at
    unless email.include?("@")
      errors.add(:email, "には@を含める必要があります")
    end
  end
end