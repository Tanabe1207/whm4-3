class TopsController < ApplicationController
  def index
    @offer = Offer.all
    if params[:nickname].present?
      @find_user = User.find_by(nickname: params[:nickname])
      @offer = @find_user.offers
      # @offer = @offer.user.get_by_nickname params[:nickname]
    end
    if params[:gender].present?
      @find_user = User.find_by(gender: params[:gender])
      @offer = @find_user.offers
    end
    if params[:nationality].present?
      @find_user = User.find_by(nationality: params[:nationality])
      @offer = @find_user.offers
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
