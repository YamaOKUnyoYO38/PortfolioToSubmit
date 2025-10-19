# app/controllers/users/sessions_controller.rb
class Users::SessionsController < Devise::SessionsController
  # POST /guest_sign_in
  def guest_sign_in
    user = User.find_or_create_by!(email: "guest@example.com") do |u|
      u.password = SecureRandom.urlsafe_base64
      u.name = "ゲストユーザー" # nameカラムがあれば
    end
    sign_in(user)
    redirect_to root_path, notice: "ゲストとしてログインしました！"
  end
end