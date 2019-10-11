Rails.application.routes.draw do
  resources :contacts, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'software', to: 'welcome#software'
  get 'comunidade', to: 'welcome#comunidade'
  get 'software/fluxo-sanguineo', to: 'welcome#fluxo_sanguineo'
  get 'software/projeto_icf', to: 'welcome#projeto_icf'

  #DASHBOARD FOLDER
  # get 'dashboard', to: 'dashboard#dashboard'
  # get 'dashboard_list_users', to: 'user#list'
  # get 'dashboard_edit_user', to: 'user#edit'

  #PROJECT FOLDER
  get 'edit_project', to: 'project#layout_dashboard'
  get 'show_project', to: 'project#show'
  patch 'update_project', to: 'project#update'
  post 'create_project', to:'project#create'

  #USER FOLDER
  get 'dashboard', to: 'user#dashboard'
  get 'new_user', to: 'user#new'
  get 'dashboard_list_users', to: 'user#layout_dashboard'
  get 'login_c', to: 'user#login_count'
  get 'dashboard_edit_project', to: 'user#layout_dashboard'
  get 'dashboard_edit_user', to: 'user#layout_dashboard'
  get 'dashboard_page_data', to: 'user#layout_dashboard'
  get 'dashboard_projects', to: 'user#layout_dashboard'
  post 'create_user', to: 'user#create'
  patch 'update_user', to: 'user#update'
  patch 'update_summary', to: 'user#update_summary'
  patch 'update_objective', to: 'user#update_objective'
  delete 'delete_user', to: 'user#delete'

  #SESSIONS FOLDER
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

end
