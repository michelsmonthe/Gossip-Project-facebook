class WelcomeController < ApplicationController
	
	#Méthode permettant de récupérer le First_name d'un utilisateur et lui retourner via la view associée un message de Bienvenue personnalisé
	def first_name
		@first_name = params[:first_name]
		puts  "$" * 88
	end
end
