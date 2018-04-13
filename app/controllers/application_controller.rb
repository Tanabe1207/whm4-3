class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #   before_filter :set_locale
  # # 全リンクにlocale情報をセットする
  # def default_url_options(options={})
  #   { :locale => I18n.locale }
  # end
  # # リンクの多言語化に対応する
  # def set_locale
  #   I18n.locale = params[:locale] || I18n.default_locale
  # end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  #ここのsessionはメソッド。cookieの操作をするのがsession。session.newでつかったsession変数のことではない。
  #今ログインしている人のidを引っ張り出し、データベースから同じuser_idを持つ「行」を@current_userに入れる。
  #||= は左辺が未定義もしくは偽なら代入の意味
  end

  def logged_in?
    !current_user.nil?
    #.nil?メソッドで上で定義したcurrent_userがnilならtrueを返すが、「！」で
    #真偽値をひっくり返すので、「空ならfalesを返す」ということ。
  end

  def offer?
    # !nil?
  end

end
