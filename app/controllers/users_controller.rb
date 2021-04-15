class UsersController < ApplicationController
  before_action :logged_in?
  def show
    @user = User.find_by id: params[:id]
    return if @user

    flash[:warning] = t("session.warning.not_found")
    redirect_to root_path
  end
end
