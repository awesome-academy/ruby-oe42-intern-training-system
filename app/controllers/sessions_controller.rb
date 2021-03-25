class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:sessions][:email].downcase
    if user&.authenticate params[:sessions][:password]
      flash[:success] = t("session.new.log_in_succes", user_name: user.name)
      log_in user
      redirect_to user
    else
      flash[:danger] = t "session.new.session_error"
      render :new
    end
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def destroy
    log_out
    render :new
  end
end