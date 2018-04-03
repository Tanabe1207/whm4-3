class InquiriesController < ApplicationController

  def index
    #入力画面表示
    @inquiry = Inquiry.new
    render :index
  end

  def confirm
    #入力値のチェック
    @inquiry = Inquiry.new(params_inquiry)
    if @inquiry.valid?
      #OKなら確認画面を表示
      render :confirm
    else
      #エラーなら入力画面再表示
      render :index
    end
  end

    def thanks
      #メールの送信
      @inquiry = Inquiry.new(params_inquiry)
      MakobangMailer.received_email(@inquiry).deliver_now

      #完了画面表示
      redirect_to 'inquiries/thanks'
    end

    private
    def params_inquiry
      params.require(:inquiry).permit(:name,:email,:message)
    end
end
