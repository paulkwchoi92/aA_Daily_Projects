class CommentsController < ApplicationController

    def create
        comment = Comment.new(comment_params)
        if comment.save
            render json: comment
        else
            render json: comment.errors.full_messages, status: 422
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        render json: comment
    end

    def show
        comment = Comment.find(params[:id])
        if comment
            render json: comment 
        else
            render json: comment.errors.full_messages, status: 404
        end
    end 

    def index

        if params[:user_id]
            render json: Comment.gather_comments_author(params[:user_id])
        elsif params[:artwork_id]
            render json: Comment.gather_comments_artwork(params[:artwork_id])
        else 
            render plain: 'boo ya'
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:author_id, :artwork_id, :body)
    end

end