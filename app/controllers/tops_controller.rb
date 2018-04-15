class TopsController < ApplicationController

  def index
    @offer = Offer.all
  end

  def search
    # @find_users = ""
    search_param = params[:search]
    if search_param.present?
      users = User.where(nickname: search_param[:nickname]).order(:id).includes(:offers)
      # @offer = @offer.user.get_by_nickname params[:nickname]
    end
    if search_param[:gender].present?
      if search_param[:gender] == "1"
        gen = "women"
      elsif search_param[:gender] == "0"
        gen = "men"
      end
      users = User.where(gender: gen).includes(:offers) #includesメソッドで紐づいてる
    end
    if search_param[:nationality].present?
      users = User.where(nationality: search_param[:nationality]).includes(:offers)
    end
    if search_param[:language].present?
      # users =User.includes(:user_language_levels).includes(:language).where(language: params[:language]).includes(:user_language_levels).includes(:user).includes(:offers)
      langs = Language.where(language: search_param[:language])
      users = []
      langs.each do |lang|
        users.push lang.user_language_level.user
      end
    end
    if users.nil?
      redirect_to :action => "index" and return
    else

      # users = UserLanguageLevel.where("language_id Like = ?" lang.id
      # user_language_levels.lang.includes(:offers)

      # includes(:user_language_levels).includes(:language).where(language: params[:language]).includes(:user_language_levels).includes(:user).includes(:offers)
      # User.includes(:user_language_levels).includes(:language).where(language: params[:language]).includes(:offers)
      # user で　has_many :user_language_levels
      # user_language_levels　で　belongs_to :language
      #whereの中のlanguageはLanguagesテーブルのlanguageカラム


      @offer = [] #配列として定義する
      users.each do |user| #usersを1つ1つ出力
        user.offers.each do |offer| #userのoffersを1つ1つ出力。これで|offer|はofferになる。
          @offer.push offer #@offer.push offerは配列使うときの書き方。@offerにofferを配列として持たせる。
        end
      end
    end
    # allの場合全て表示される？
    # offerに紐づいたuserのテーブルの中身の一部も表示させたい
    render template: "tops/index" and return
  end

  def create
    @offer = current_user.offers.new#(offer_params)
    if @offer.save
      redirect_to root_path, notice:'投稿しました'
    else
      flash.now[:alert]="投稿に失敗しました"
      render :new
    end
  end
  # def create

  # private
  # def offer_params
  #   params.require(:offer).permit(:)
  #
end
