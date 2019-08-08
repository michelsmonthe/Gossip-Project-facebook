Rails.application.routes.draw do
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :city
  resources :gossip
  resources :user
  
  #Chemin vers la page d'acceuil qui retourne tous les gossips (nom de l'auteur et le titre de ces derniers)
  get '/', to: 'gossip#index'

  #Chemin d'accès permettant d'afficher la page des auteurs
  
  
  # Chemin d'accès vers la page statique de présentation de la team
  get '/team', to: 'static_pages#team'
  # Chemin d'accès vers la page statique de Contact
  get '/contact', to: 'static_pages#contact'

  # Chemin d'accès vers la landing page de Bienvenue personnalisée
  get 'welcome/:first_name', to: 'welcome#first_name'


end
