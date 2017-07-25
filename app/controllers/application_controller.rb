class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_permitted_parameters_edit, if: :devise_controller?
  before_action :request_path
  before_action :set_user_stats, except:[:new, :moment, :index, :create, :search, :destroy, :edit, :update]
  before_action :imageBox

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def configure_permitted_parameters_edit
    devise_parameter_sanitizer.permit(:account_update, keys: [:intro, :avatar, :name, :cover])
  end

  def request_path
    @path = controller_path + '#' + action_name
    def @path.is(*str)
        str.map{|s| self.include?(s)}.include?(true)
    end
  end

  def set_user_stats
    @user = User.find(params[:id])
    @followedUsers = Relation.where(user_id: current_user.id)
    @following_ids = []
    @following_ids << current_user.id
    @followedUsers.each do |followed|
      @following_ids << followed.following_id

    @numOfTweets = @user.tweets.count
    @numOfFollows = @followedUsers.count

    # フォロワーカウント
    allFollowers = Relation.where(following_id: @user.id)
    @myFollowersCount = allFollowers.count
      if @myFollowersCount == nil
      return 0
      end
    end
  end

  def imageBox
    @imageTweets = Tweet.includes(:user).where.not(image: nil).order("created_at DESC").limit(6)
  end

end
