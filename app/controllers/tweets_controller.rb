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
    @tweets = Tweet.where("user_id IN(?)", following_ids).order("created_at DESC")
  end

  def moment
    @user = current_user
    @tweets = Tweet.order("created_at DESC")
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
    words = ["あほ", "アホ", "阿呆", "ぼけ", "ボケ", "かす", "カス", "しね", "エロ", "エッチ", "えっち", "陰毛", "まんこ", "腟", "クリトリス", "ちんこ", "差別", "朝鮮", "チンコ", "ちんちん", "TNTN", "ペニス", "金玉", "肉棒", "勃起", "おっき", "精子", "射精", "ザーメン", "●～", "セックス", "SEX", "アナル", "あなる", "おっぱい", "π", "巨乳", "爆乳", "超乳", "貧乳", "無乳", "微乳", "つるぺた", "ちっぱい", "ペチャパイ", "カップ", "手ブラ", "ブラ", "パンツ", "パンツァー", "パンティ", "ノーパン", "乳首", "ちくび", "自慰", "ナニ", "バンド", "オナニー", "072", "オナ禁", "しこしこ", "シコシコ", "クンニ", "フェラ", "まんぐり", "パイズリ", "風俗", "性的な意味で", "デリヘル", "包茎", "童貞", "処女", "バイブル", "パイパン", "パイパンP", "中田氏", "スカトロ", "クソ", "うんこ", "ホモ", "バイセクシャル", "ゲイ", "レズビアン", "homo", "ぱいぱい", "ノーブラ", "手コキ", "手マン", "きもい", "変態", "馬鹿", "baka", "fuck", "ファック", "ケツ", "キチガイ", "ブタ", "bitch", "ビッチ", "死ね", "氏ね", "shine", "タヒね", "セーフ", "乞食", "ロリババァ", "BBA", "くず", "屑", "レイプ"]
    @tweet = Tweet.new(tweet_params)
    words.each do |word|
      if @tweet.content.include?(word) == true
        render :caution and return
      end
    end
  end

end

#   def checking_word
#     @tweet = Tweet.new(tweet_params)
#      # if @tweet.content.include?("しね")
#     badwords = ["しね", "しね", "ぼけ", "かす", "あほ"]
#     badwords.each do |badword|
#       bad = badword
#     end
#       if @tweet.content.include?(bad)
#       render :caution
#     end
#   end
# end



# def create
  #   @tweet = Tweet.new(tweet_params)
  #   checkedContent = ["#{@tweet.content}"]
  #    if checkedContent.include?("しね")
  #     return checkedContent
  #     redirect_to caution_tweets_path
  #   elsif @tweet.save
  #     flash[:notice] = 'ツイートしました'
  #     redirect_to root_path
  #   else
  #     flash[:alert] = "ツイートに失敗しました"
  #     render :new
  #   end
  # end


  # def caution(create)
  #   @tweet = Tweet.new(tweet_params)
  #   if @tweet.save
  #     flash[:notice] = 'ツイートしました'
  #     redirect_to root_path
  #   else
  #     flash[:alert] = "ツイートに失敗しました"
  #     render :new
  #   end
  # end

  #  def create
  #   @tweet = Tweet.new(tweet_params)
  #   checkedContent = ["#{@tweet.content}"]
  #    if checkedContent.include?("しね")
  #     @tweet = Tweet.new(tweet_params)
  #     render :caution
  #   elsif @tweet.save
  #     flash[:notice] = 'ツイートしました'
  #     redirect_to root_path
  #   else
  #     flash[:alert] = "ツイートに失敗しました"
  #     render :new
  #   end
  # end
