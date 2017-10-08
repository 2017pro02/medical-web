Rails.application.routes.draw do
  root "pages#index"
  get "dashboard", to: "pages#dashboard"

  get "@:name", to: "user_profile#show", as: "user_profile_show"
  get "user_profile/edit"
  match "user_profile/update", via: [:post, :patch]

  resources :meals do
    post "comment", on: :member
  end

  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  devise_for :users

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
