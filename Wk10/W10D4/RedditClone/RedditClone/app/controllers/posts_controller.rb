class PostsController < ApplicationController

    def new 
        @post = Post.new
    end 

    def create 
        @post = Post.new(post_params)
        @post.sub_id = params[:sub_id]
        @post.user_id = current_user.id 
        if @post.save 
            redirect_to 
        else
            flash.now[:errors] = @post.errors.full_messages 
            render :new
        end
        
      

    end 

    def show 

    end 

    def edit 

    end 

    def update 

    end 

    def destroy 

    end

    private 
    def post_params 
        params.require(:post).permit(:title, :url, :content)
    end

end




log 

subjects
  - post 
  - post    ---------- context, blah ,blach link(edit)
  - link(create)