class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private
  # ログイン済みユーザーかどうか確認
   def logged_in_user
     unless logged_in?
       redirect_to login_url
     end
   end
   
end
