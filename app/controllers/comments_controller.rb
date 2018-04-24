class CommentsController < ApplicationController
  def index
    @comments=Comment.where(user_id:current_user.id).where(offer_id:params[:offer_id])
    @comment = Comment.new
    #comment/newでテーブル作成
    #def new はnew.htmlへのrender
    #作ったのは空のテーブル。newで入力する内容を教えてあげてる。
    #ここでは"contents"
  end

  def create
    #この時点ではまだCommentテーブルの中身は空。この下のコードで@commentインスタンス変数に
    #値を入れていく。ちなみに、userのnewで投稿に失敗した場合、名前などが残ってリダイレクトされる。
    #これはrenderして、変数@userの中に値を残したままリダイレクトされるから。一方で
    #redirectメソッドを使うと単純に　　%未記入%
    @comment=Comment.new
    @comment.user_id = current_user.id
    @comment.offer_id = params[:comment][:offer_id] #OK?
    @comment.contents = params[:comment][:contents]
    if @comment.save
      redirect_to comments_index_path(offer_id: params[:comment][:offer_id]), notice: 'コメントを投稿しました'
    else
      redirect_to comments_index_path(offer_id: params[:comment][:offer_id]), notice: 'コメントの投稿に失敗しました'
    end
  end

  def allcomments
    @all_comments=Comment.all
  end
end
