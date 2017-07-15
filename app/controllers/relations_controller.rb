class RelationsController < ApplicationController


  def create
    @follow = Relation.new(user_id:relation_params[:user_id],following_id:relation_params[:following_id])
    @follow.save
    respond_to do |format|
       format.json
    end
  end

  def destroy
    relation = Relation.find(params[:id])
    if relation.destroy
      redirect_to following_user_path(current_user)
    end
  end

  # def update
  #   @group = Group.find(params[:id])
  #     if @group.update(group_params)
  #       redirect_to group_messages_path(@group.id), notice: "グループを編集しました。"
  #     else
  #       flash[:alert] = "グループの編集に失敗しました"
  #       render :edit
  #     end



  def index
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

