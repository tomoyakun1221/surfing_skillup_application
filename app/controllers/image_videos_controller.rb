class ImageVideosController < ApplicationController
  before_action :set_one_month, only: [:index, :show]

  def index
    @image_videos = ImageVideo.paginate(page: params[:page]).order(:id)
    @users = User.paginate(page: params[:page]).order(:id)
    if params[:name].present?
      @users = @users.get_by_name params[:name]
    end
  end

  def show
    @image_videos = ImageVideo.paginate(page: params[:page]).order(:id)
  end
end
