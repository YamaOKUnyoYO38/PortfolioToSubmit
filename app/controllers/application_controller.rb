class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # ログイン・新規登録後の遷移先
  def after_sign_in_path_for(resource)
    new_template_path
  end

  # ログアウト後の遷移先
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  # Deviseの許可パラメータ設定
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation])
  end
end
