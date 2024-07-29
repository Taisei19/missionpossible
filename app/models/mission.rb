class Mission < ApplicationRecord

  belongs_to :user
  has_many :levels, dependent: :destroy
  has_many :comments

  after_create :create_initial_level
  
  private
  
  def create_initial_level 
      levels.create(user: user, number: 1)
  end
  
end
