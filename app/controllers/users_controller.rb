class UsersController < ApplicationController
  before_action :authenticate_user!

  def top_page
    @user = User.find(current_user.id)
  end

  def show
    @user = User.find(current_user.id)
  end

  def index
  end
end