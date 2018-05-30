class MicropostsController < ApplicationController

before_action :logged_in_user, only:[:new,:create,:destroy]

  def new
    @micropost = current_user.microposts.build
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "投稿完了しました。"
      redirect_to microposts_path
    end
  end

  def index
    @microposts = Micropost.all
  end

  def destroy
    Micropost.find(params[:id]).destroy
    flash[:success] = "削除しました"
    redirect_to request.referrer || root_url
  end

  private
  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
