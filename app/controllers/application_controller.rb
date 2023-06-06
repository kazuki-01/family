class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

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
