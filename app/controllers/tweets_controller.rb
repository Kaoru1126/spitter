class TweetsController < ApplicationController
  before_action :set_user, only: [:index, :crete, :caution, :checked]
  before_action :checking_word, only: [:create]

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

  def caution
    @tweet = Tweet.new
  end

  def checked
    @tweet = Tweet.new(tweet_params)
     if @tweet.save
      flash[:notice] = 'ツイートしました'
      redirect_to root_path
    else
      flash[:alert] = "ツイートに失敗しました"
      render :new
    end
  end

  def index
    @user = current_user
    @followedUsers = Relation.where(user_id: current_user.id)
    following_ids = []
    following_ids << current_user.id
    @followedUsers.each do |followed|
      following_ids << followed.following_id
    end
    @recommends = User.where.not(id:following_ids).limit(3)
    @tweets = Tweet.where("user_id IN(?)", following_ids).order("created_at DESC").page(params[:page]).per(6)
  end

  def moment
    @user = current_user
    @tweets = Tweet.order("created_at DESC").page(params[:page]).per(6)
    @followedUsers = Relation.where(user_id: current_user.id)
    following_ids = []
    following_ids << current_user.id
    @followedUsers.each do |followed|
      following_ids << followed.following_id
    end
    @recommends = User.where.not(id:following_ids).limit(3)
  end

  private

  def set_user
    @tweet = current_user.id
  end

  def tweet_params
    params.require(:tweet).permit(:content, :image).merge(user_id: current_user.id)
  end

  def checking_word
    words = ["あほ", "アホ", "阿呆", "ぼけ", "ボケ", "かす", "カス", "しね", "朝鮮", "チョン", "デリヘル", "包茎", "童貞", "処女", "クソ", "うんこ", "ホモ", "バイセクシャル", "ゲイ", "レズビアン", "homo", "きもい", "キモい", "キモい", "変態", "馬鹿", "baka", "fuck", "ファック", "ケツ", "キチガイ", "基地外", "気違い", "気狂い" "ブタ", "bitch", "ビッチ", "死ね", "氏ね", "shine", "タヒね", "ﾀﾋ", "タヒ" "市ね", "乞食", "ロリババァ", "BBA", "くず", "屑", "レイプ", "醜", "ブス", "不細工", "ぶす", "殺す", "殺", "殺害", "ガイジ", "野郎", "メンヘラ", "ヤリマン", "性病", "ヲタ", "部落", "ニガー", "黒人", "土人", "外国人", "田舎者", "ノータリン"]
    @tweet = Tweet.new(tweet_params)
    words.each do |word|
      if @tweet.content.include?(word) == true
        render :caution and return
      end
    end
  end

end

