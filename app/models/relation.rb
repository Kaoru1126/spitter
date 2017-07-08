class Relation < ApplicationRecord
  validates :user_id,      presence: true
  validates :following_id,  presence: true

  belongs_to :user
end
