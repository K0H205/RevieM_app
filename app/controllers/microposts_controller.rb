class MicropostsController < ApplicationController

before_action :logged_in_user, only:[:new,:create,:destroy]

  def new
    #current_userに紐づいたmicropostオブジェクトを返す
    @micropost = current_user.microposts.build
  end

  def create
    #postされた情報でcurrent_userに紐づいたmicropostを作成する
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "投稿完了しました"
      redirect_to microposts_path
    end
  end

  def index
    #micropost.model.rb => def serch
    @microposts = Micropost.paginate(page: params[:page]).search(params[:search])
    #最新のmicropost４件を取得する
    @micropost = Micropost.find_by_sql("select * from microposts order by created_at DESC limit 4")

  end

  def destroy
    Micropost.find(params[:id]).destroy
    flash[:success] = "投稿を削除しました"
    redirect_to request.referrer || root_url
  end

  private
  def micropost_params
    params.require(:micropost).permit(:content,:picture,:stars,:serch)
  end
end

