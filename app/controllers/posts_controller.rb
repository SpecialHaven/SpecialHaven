class PostsController < ApplicationController
	def like
		@post = Post.find(params[:post_id])
		if @post.liked_by?(current_user)
			Like.where(user: current_user, post: @post).destroy_all
		else
			Like.create(user_id: current_user.id, post_id: params[:post_id])
		end
		respond_to do |format|
		    format.html { redirect_to :back }
		    format.js { }
  		end
	end


end
