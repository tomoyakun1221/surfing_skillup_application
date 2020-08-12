class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy, :edit_user_info, :update_user_info]

  def top_page
    @user = User.find(current_user.id)
  end

  def show
    @user = User.find(current_user.id)
  end

  def index
    @users = User.paginate(page: params[:page]).order(:id)
    if params[:name].present?
      @users = @users.get_by_name params[:name]
    end
  end

  def edit_user_info
  end

  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end
end