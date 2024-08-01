class Mission < ApplicationRecord

  belongs_to :user
  has_many :levels, dependent: :destroy
  has_many :comments, dependent: :destroy

  after_create :create_initial_level
  
  validates :goal, presence: true
  validates :mission1, presence: true
  validates :mission2, presence: true
  validates :mission3, presence: true

  private
  
  def create_initial_level 
      levels.create(user: user, number: 1)
  end

end
