class CommentsController < ApplicationController
    def new
        @post=Post.new
    end
    def create

      @post=Post.find(params[:post_id])
      @comment=@post.comments.create(comment_params)
      if @comment.save
        flash[:success]='Comment Posted'
        respond_to do |format|
            format.html { redirect_to post_path(@post)}
            format.js #render comments/create.js.erb
      end
    end
end

    def mycomment
        @comment=Comment.find(params[:comment_id])
    
        @com=@comment.comments.create(com_params)
        redirect_to posts_path
    end

    

    private
    def comment_params
        params[:comment][:user_id] = current_user.id
        params.require(:comment).permit(:body, :comment_id,:user_id)
    end

    def com_params
        params[:comment][:commentable_type] = "Comment"
        params.require(:comment).permit(:body,:comment_id,:commentable_type)
    end

    
    

  
    
end
