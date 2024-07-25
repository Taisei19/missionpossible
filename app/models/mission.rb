class Mission < ApplicationRecord

  belongs_to :user
  has_many :levels, dependent: :destroy

end
