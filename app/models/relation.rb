class Relation < ApplicationRecord
  validates :user_id,      presence: true
  validates :folloing_id,  presence: true
  
  belongs_to: user
end
