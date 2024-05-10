Rails.application.routes.draw do
  get "user/show"
  resources :user_notes
  resources :notes
  devise_for :users,
    path: "",
    path_names: {
      sign_in: "login",
      sign_out: "logout",
      registration: "signup"
    },

    controllers: {
      sessions: "users/sessions",
      registrations: "users/registrations"
    }
  resources :user, only: [:show]
  root "static#home"
end
