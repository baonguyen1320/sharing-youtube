Rails.application.routes.draw do
  root "movies#index"
  # match '*path' => redirect('/'), via: :get

  devise_for :users,
             controllers: { sessions: 'users/sessions', registrations: 'users/registrations' },
             path: '',
             path_names: { sign_in: 'login', sign_out: 'logout' },
             only:        %i[sessions registrations]

  resources :movies
end
