Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'software', to: 'welcome#software'
  get 'eletronica', to: 'welcome#eletronica'
  get 'software/fluxo-sanguineo', to: 'welcome#fluxo_sanguineo'
  get 'software/projeto_icf', to: 'welcome#projeto_icf'
end
