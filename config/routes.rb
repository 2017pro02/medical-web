Rails.application.routes.draw do
  root "pages#index"
  get "dashboard", to: "pages#dashboard"

  resources :users, only: [:show, :edit, :update], path: "/", param: :name, constraints: { name: /@\w+/ } do
    resources :meals, param: :date, constraints: { date: %r{\d{4}\/\d{2}\/\d{2}} } do
      post "comment", on: :member
    end
  end

  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  devise_for :users

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
