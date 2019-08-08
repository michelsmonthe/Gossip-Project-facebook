class GossipController < ApplicationController
  def index
  	#permet d'afficher une alerte à l'utilisateur
  	puts flash[:alert]
  	@gossips = Gossip.all
  end

  def show
  	@gossip = Gossip.find(params['id'].to_i)
  end

  def new
    
  end
  
  def create
	  @gossip = Gossip.new(user: User.last, title: params[:title], content: params[:content])
	    if @gossip.save
	      redirect_to gossip_index_path, alert: 'Votre gossip a bien été sauvegardé'
	    else
	      render :new
	    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    @gossip_modify = @gossip
    update_params = params.permit(:title, :content)
    if @gossip.update(update_params)
      redirect_to gossips_path, alert: 'Votre gossip a bien été sauvegardé'
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path, alert: 'Votre gossip a bien été supprimé'
  end


end
