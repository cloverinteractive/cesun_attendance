CesunAttendance::Application.routes.draw do
  devise_for :users

  devise_scope :user do
    root :to => 'devise/sessions#new', :via => :get
  end

  resources :users, :only => [ :index, :edit, :update, :destroy ] do
    collection do
      get :role_list
    end
  end

  resources :study_plans
  resources :shifts
  resources :professions, :except => :show
  resources :users, :only => :destroy
end
