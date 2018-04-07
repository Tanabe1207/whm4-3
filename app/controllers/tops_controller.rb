class TopsController < ApplicationController

  def index
    @offer = Offer.all
  end

  def search
    # @find_users = ""
    if params[:nickname].present?
      @find_users = User.where(nickname: params[:nickname]).order(:id)
      @offer = @find_users.offers
      # @offer = @offer.user.get_by_nickname params[:nickname]
    end
    if params[:gender].present?
      if params[:gender] == "1"
        gen = "women"
      elsif params[:gender] == "0"
        gen = "men"
      end
      @find_users = User.where(gender: gen)
      @offer = @find_users.offers
    end
    if params[:nationality].present?
      @find_users = User.where(nationality: params[:nationality])
      @offer = @find_users.offers
    end
    # allの場合全て表示される？
    # offerに紐づいたuserのテーブルの中身の一部も表示させたい
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
