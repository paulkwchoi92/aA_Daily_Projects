class ArtworkSharesController < ApplicationController

    def update
        artwork_share = ArtworkShare.find(params[:id])
        if artwork_share.update(artwork_share_params)
            render json: artwork_share
        else
            render json: artwork_share.errors.full_messages, status: 422
        end
    end
    
    def destroy
        artwork_share = Artwork.find(params[:id])
        artwork_share.destroy
        render json: artwork
    end

    private

    def artwork_share_params
        params.require(:artwork_share).permit(:artist_id, :viewer_id)
    end
end