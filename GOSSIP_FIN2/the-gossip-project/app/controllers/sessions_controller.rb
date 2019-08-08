class SessionsController < ApplicationController
  
	def new

	end

	def create
		  # cherche s'il existe un utilisateur en base avec l’e-mail
		  user = User.find_by(email: params[:email])

		  # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
		  if user && user.authenticate(password: params[:password])
		    log_in(user)
		    # redirige vers la page d'acceuil avec un flash
		    flash[:success] = "Vous êtes bien connecté à votre espace de commerage préféré !"
	    	redirect_to gossip_index_path
		  else
		    flash.now[:danger] = 'Combinaison email/password incorrecte!!!'
		    render :new
		  end
	end

	def destroy
	    session.delete(:user_id)
	    redirect_to gossips_path
	end
end
