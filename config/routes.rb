Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root "home#index"  # トップページ（任意でhomeコントローラ作成）

  resources :templates, only: [:index, :new, :create, :show]
   # ゲストログイン用ルート
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in", as: :users_guest_sign_in
  end
end
