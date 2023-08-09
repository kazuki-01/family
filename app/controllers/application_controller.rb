class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_user

  def set_current_user
   @current_user=User.find_by(id: session[:user_id])
  end

  def authenticate #ログインしていなかったらログイン画面にリダイレクト
    redirect_to new_user_session_url unless user_signed_in?
  end

  def fobid_login_user #ログインしていたら一覧画面にリダイレクト
    if @current_user
      redirect_to("/posts")
    end
  end

  private

  def configure_permitted_parameters
    # 新規登録時にnameの取得を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # 情報更新時にnameの取得を許可
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :user_icon])
  end
  
  def after_sign_in_path_for(resource)
    posts_path
  end

end
