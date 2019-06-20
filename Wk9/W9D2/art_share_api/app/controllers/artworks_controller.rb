class ArtworksController < ApplicationController
    def index
      if params[:id]
        render json: Artwork.gather(params[:id])
      else
        render json: Artwork.all
      end
    end
    
    def show 
      artwork = Artwork.find(params[:id])
       render json: artwork
    end
  
    def create 
      artwork = Artwork.new(artwork_params)
      if artwork.save
        render plain: "created artwork: #{artwork.artworkname} with id: #{artwork.id}", json: artwork
      else
        render json: artwork.errors.full_messages, status: 422
      end
      
    end
  
    def update
      artwork = Artwork.find(params[:id])
      if artwork.update(artwork_params)
        render json: artwork
      else
        render json: artwork.errors.full_messages, status: 422
      end
    end
  
    def destroy
      artwork = Artwork.find(params[:id])
      artwork.destroy
      render json: artwork
    end
  
    def nest
      render json: params['some_category']['inner_inner_hash']
    end
  
    private
  
    def artwork_params
      params.require(:artwork).permit(:title, :artist_id)
    end
end