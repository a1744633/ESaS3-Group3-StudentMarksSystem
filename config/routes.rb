Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'login#admin'
  # add routes later to the html.erb

  resources :student_mark
  resources :assignment
  resources :course
  resources :login

end
