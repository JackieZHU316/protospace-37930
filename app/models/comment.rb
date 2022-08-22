class Comment < ApplicationRecord
  validates :concept, presence: true

  belongs_to :prototype
  belongs_to :user
end
