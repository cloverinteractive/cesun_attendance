CesunAttendance::Application.routes.draw do
  devise_for :users

  devise_scope :user do
    root :to => 'devise/sessions#new', :via => :get
  end
end
