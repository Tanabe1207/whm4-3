class SessionsController < ApplicationController
  def new
  end

  def create
    user=User.find_by(mail: params[:session][:mail])
    #find_byはモデル名にfind_byメソッドをつなげて引数を1つ以上指定するメソッド。
    #find_byは「行」を持ってきてる
    #モデル名.find_by(特定の条件)
    #なお、データが見つからなかった場合はnilを返します。
    if user && user.authenticate(params[:session][:password])
      # &&はaとbが共に真の場合に真
      # 左辺は、user=User.find_by(mail: params[:session][:mail])で行が入って、nilでないのでtrue.
      # 右辺は、user（行）に.authenticateメソッドで、viewで指定した変数sessionの中身のpasswordとデータベースの暗号化されたpasswordが一致しているか確かめている。
      #一致していればtrue。左辺と右辺両方がtrueならtrueを返す。
      log_in user
      #()を省略してる
      redirect_to tops_index_path, alert:'ログインに成功しました'
    else
      flash[:denger] = 'ログインに失敗しました'
      render 'new'
    end
   end

    def destroy
     log_out
     redirect_to tops_index_url
    end

   private
    def log_in(user)
      session[:user_id] = user.id
      #sessionの中のuser_idカラムに、ログインしたuserのidを入れる。
    end

    def log_out
      session.delete(:user_id)
      @current_user = nil
    end

end
