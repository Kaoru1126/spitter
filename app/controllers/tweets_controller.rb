class TweetsController < ApplicationController
  before_action :set_user, only: [:index]
  def index

  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      flash[:notice] = 'ツイートしました'
      redirect_to root_path 
    else
      flash[:alert] = "ツイートに失敗しました"
      render :new
    end

  end

  private

  def set_user
    @tweet = current_user.id
  end

  def tweet_params
    params.require(:tweet).permit(:content, :image).merge(user_id: current_user.id)
  end

end

