class TopsController < ApplicationController
  def index
    @offer = Offer.all
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
