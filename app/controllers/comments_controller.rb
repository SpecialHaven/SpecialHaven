class CommentsController < ApplicationController


	def like
		@comment = Comment.find(params[:comment_id])
		if @comment.liked_by?(current_user)
			CommentLike.where(user_id: current_user.id, comment_id: @comment.id).destroy_all
		else
			CommentLike.create(user_id: current_user.id, comment_id: params[:comment_id])
		end
		respond_to do |format|
		    format.html { redirect_to :back }
		    format.js { }
  		end
	end

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params.merge(user: current_user))
		if @comment.save
			flash[:notice] = "Comment added successfully."
			redirect_to :back
		else
			flash[:notice] = "Please try commenting again."
			redirect_to :back
		end
	end

	private

		def comment_params
			params.require(:comment).permit(:post_id, :comment)
		end

end
