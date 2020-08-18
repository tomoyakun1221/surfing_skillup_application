class FavoritesController < ApplicationController
  def create
    user = current_user
    image_video = ImageVideo.find_by(params[:id])
    if favorite = Favorite.create(user_id: user.id, image_video_id: image_video.id)
      flash[:success] = "お気に入り追加成功しました。"
    else
      flash[:danger] = "お気に入り追加失敗しました。"
    end
    redirect_to favorites_url
  end

  def destroy
    user = current_user
    image_video = ImageVideo.find(params[:id])
    if favorite = Favorite.find_by(user_id: user.id, image_video_id: image_video.id)
      favorite.delete
      flash[:danger] = "お気に入りから削除しました。"
    else
      flash[:danger] = "お気に入り削除失敗しました。"
    end
    redirect_to image_video_url
  end

  def index
    @favorites = Favorite.paginate(page: params[:page]).order(:id)
    @image_videos = ImageVideo.paginate(page: params[:page]).order(:id)
  end
end
