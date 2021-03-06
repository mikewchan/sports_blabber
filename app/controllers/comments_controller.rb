class CommentsController < ApplicationController
	before_filter :get_post

	# def get_post
	#	@post = Post.find(params[:post_id])
	# end

	def index
		@comments = @post.comments.all
	end

	def create
        @post = Post.find(params[:post_id])
		@comment_hash = params[:comment]
		@obj = @comment_hash[:commentable_type].constantize.find(@comment_hash[:commentable_id])
        # Not implemented: check to see whether the user has permission to create a comment on this object
        @comment = Comments.build_from(@obj, current_user.id, @comment_hash[:body])
        if @comment.save
          render :partial => "comments/comment", :locals => { :comment => @comment }, :layout => false, :status => :created
        else
          render :js => "alert('error saving comment');"
        end
     end

     def destroy
     	@comment = Comment.find(params[:id])
     	if @comment.destroy
     		render :json => @comment, :status => :ok
     	else
     		render :js => "alert('error deleting comment');"
     	end
     end
end