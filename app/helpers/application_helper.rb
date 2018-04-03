module ApplicationHelper

  def current_user
  #現在ログインしているuserを返すメソッド
  #ゲッター。ゲッターはインスタンス変数の値を取得するためのメソッド

  @current_user ||= User.find_by(id: session[:user_id])
  #||= は左辺が未定義もしくは偽なら代入の意味
  # モデル名.find_byは特定の条件にマッチした最初のレコードを取得の意味https://www.sejuku.net/blog/13000参照。
  #ここではsessionで入力されたUserのテーブルのを取得し@current_userに代入している。
  end

  def logged_in?
  !current_user.nil?
  end
#ここから下 link_to_add_fieldsヘルパー
  def link_to_add_fields(name, f, association)
   new_object = f.object.send(association).klass.new
   id = new_object.object_id
   fields = f.fields_for(association, new_object, child_index: id) do |builder|
     render(association.to_s.singularize + "_fields", f: builder)
   end
   link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
 end

end
