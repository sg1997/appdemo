class PostsController < ApplicationController
    def index
      
        @post=Post.order('updated_at DESC')
        @postt=Post.where(:published =>true).order('updated_at DESC')
      
    end

    def new
        @post=Post.new
    end
    
    
    def create
        @post = Post.new(post_params)
        if @post.save
         redirect_to @post
        else
            render 'new'
        end
    end 
    def edit
         
      @post=Post.find(params[:id])
    end

 def update
    @post=Post.find(params[:id])
 
  if @post.update(post_update_params)
    redirect_to posts_path
  else
    render 'edit'
  end
end
      
    def show 
        @post=Post.find(params[:id])
    end  
    
    def destroy 
      
        @post = Post.find(params[:id])
        @post.destroy

        redirect_to posts_path
    end

    def myposts
      @posts=User.find(params[:user_id]).posts
    end
     
    private
    def post_update_params
      params[:post][:user_id]=@post.user_id
      params.require(:post).permit(:title,:body,:user_id,:all_tags,:published)
    end

     def post_params
        params[:post][:user_id] = current_user.id
        params.require(:post).permit(:title,:body,:user_id,:all_tags,:published)
     end  
     
      
end
