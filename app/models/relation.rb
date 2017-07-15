class Relation < ApplicationRecord
  validates :user_id,      presence: true
  validates :following_id,  presence: true
  validate :prohibit_same_records


  def prohibit_same_records
    if Relation.where(user_id: user_id, following_id: following_id).exists?
      errors.add(:prohibit_same_records, ": フォローずみです")

    end
  end

  

  belongs_to :user
end
