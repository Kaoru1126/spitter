module ApplicationHelper
  
  def amIfollowing?(following_id)
    if Relation.where(user_id: current_user.id, following_id: following_id).exists?
      return true
    else
      return false
    end
  end
end
