class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!

  # deviseコントローラーにストロングパラメータを追加する          
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age])
    # アカウント編集の時にnameとageのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :age])
  end
end
