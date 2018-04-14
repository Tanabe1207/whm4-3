class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale

    private
    # I18n.locale をセットする
    def set_locale
      I18n.locale = locale_in_params || locale_in_accept_language || I18n.default_locale
    end

    # params の locale の値（優先すべき）
  
    #   params から取った locale
    #   有効な値でなければ :en
    #   取得できなかった場合 nil
    def locale_in_params
      if params[:locale].present?
        params[:locale].to_sym.presence_in(I18n::available_locales) || I18n.default_locale
      else
        nil
      end
    end

    # 環境変数 HTTP_ACCEPT_LANGUAGE を順に検証し、最初に一致した有効な locale を返す
    # @return [Symbol]  環境変数 HTTP_ACCEPT_LANGUAGE から取った locale 。取得できなかった場合 nil
    def locale_in_accept_language
      request.env['HTTP_ACCEPT_LANGUAGE']
        .to_s # nil 対策
        .split(',')
        .map{ |_| _[0..1].to_sym }
        .select { |_| I18n::available_locales.include?(_) }
        .first
    end

    # 全リンクに locale 情報をセットする
    # @return [Hash] locale をキーとするハッシュ
    def default_url_options(options = {})
      { locale: I18n.locale }
    end


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
