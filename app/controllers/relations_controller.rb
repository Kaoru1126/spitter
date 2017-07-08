class RelationsController < ApplicationController


  def create
    @follow = Relation.new(user_id:relation_params[:user_id],following_id:relation_params[:following_id])
    @follow.save
    respond_to do |format|
       format.json
    end
  end

  def destroy
    # @unfollow =
  end


  def index
    # binding.pry
    # @followings =
    # @followers =
    # @recommends = User.all
  end

  private

  def relation_params
    params.permit(:user_id, :following_id)
  end


  def set_user
  end

end

