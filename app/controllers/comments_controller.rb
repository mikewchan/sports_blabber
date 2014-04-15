class CommentsController < ApplicationController
	before_filter :get_post

	def get_post
		@post = Post.find(params[:post_id])
	end

	def index
		@comments = @post.comments.all
	end
end