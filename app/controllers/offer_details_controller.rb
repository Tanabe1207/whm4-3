class OfferDetailsController < ApplicationController
  def index
   @offer_details=Offer.find(params[:a])
   # fineメソッドはidでレコード（行）の情報を引っ張ってくるメソッド。
   # findはidのみを引数に取る。

  end
end
