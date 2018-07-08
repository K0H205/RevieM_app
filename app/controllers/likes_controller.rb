class LikesController < ApplicationController
before_action :logged_in_user

  def create
    @micropost = Micropost.find(params[:micropost_id])
    #該当したmicropostがcurrent_userでlikeされていなければ実行
      unless @micropost.like?(current_user)
        #likeを付与する
        @micropost.likeadd(current_user)
        @micropost.reload
        respond_to do |format|
          format.html { redirect_to request.referrer || root_url }
          format.js
        end
      end
  end

  def destroy
    #選択したlikeのmicropostを検索する
    @micropost = Like.find(params[:id]).micropost
    #該当したmicropostがcurrent_userでlikeされていれば実行
    if @micropost.like?(current_user)
      #likeを解除する
      @micropost.likedel(current_user)
      @micropost.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end
end
