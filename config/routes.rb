require "sidekiq/web"

Rails.application.routes.draw do
  root "pages#index"
  get "dashboard", to: "pages#dashboard"
  get "tv", to: "pages#tv"

  resources :users, only: [:show, :edit, :update], path: "/", param: :name, constraints: { name: /@\w+/ } do
    resources :meals, param: :date, constraints: { date: %r{\d{4}\/\d{2}\/\d{2}} } do
      post "comment", on: :member
    end
  end

  resources :nutritions

  devise_for :users

  authenticate :user, ->(u) { u.is_admin? } do
    mount RailsAdmin::Engine => "/admin", as: "rails_admin"
    mount Sidekiq::Web => "/sidekiq"
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
