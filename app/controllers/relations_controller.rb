class RelationsController < ApplicationController


  def create
    @follow = Relation.new(user_id:relation_params[:user_id],following_id:relation_params[:following_id])
    @follow.save
    respond_to do |format|
       format.json
       format.html { redirect_to controller: 'users', action: 'show', id: params[:following_id] }
    end
  end

  def destroy
    relation = Relation.find(params[:id])
    if relation.destroy
      redirect_to following_user_path(current_user)
    end
  end

  def index
  end

  private

  def relation_params
    params.permit(:user_id, :following_id)
  end


  def set_user
  end

end

