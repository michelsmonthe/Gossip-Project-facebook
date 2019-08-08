class UserController < ApplicationController

	def new
		
	end

	def create
		@user = User.new(first_name: params[:first_name], last_name: params[:last_name], description: params[:description] , email: params[:email], age: params[:age], city: City.find_by(city:params[:city].id), password: params[:password])
		    if @user.save
		      redirect_to gossip_index_path, alert: 'Votre profil a bien été créé'
		    else
		      render :new
		    end
	end


	  def show
	    @user = User.find(params[:id])
	  end

end
