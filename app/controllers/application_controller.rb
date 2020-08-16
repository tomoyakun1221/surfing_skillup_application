class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :birthday, :tel, :email])
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_one_month
    @first_day = params[:date].nil? ? Date.current.beginning_of_month : params[:date].to_date
  end
end
