class OffersController < ApplicationController
  def new
    @offer = Offer.new
  end

  def create
   @offer = current_user.offers.new(offer_params)
    if @offer.save
      redirect_to tops_index_path, notice:'投稿に成功しました'
    else
      flash.now[:alert]="投稿失敗"
      render :new
    end
  end

  private
  def offer_params
    params.require(:offer).permit(:country, :state, :region, :period_from, :period_to, :title, :detail, :offer_image, :created_at)
  end

end


# t.integer: user_id
# t.string: country
# t.string: state
# t.string: region
# t.integer: period_from
# t.integer: period_to
# t.string: title
# t.string: detail
# t.string: offer_image
