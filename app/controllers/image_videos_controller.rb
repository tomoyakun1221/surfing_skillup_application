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

  def search
    @q = ImageVideo.ransack(search_params)
    @staffs = @q.result(distinct: true)
  end

  private

  def search_params
    params.require(:q).permit(:photograph_day_on, :title)
  end
end
