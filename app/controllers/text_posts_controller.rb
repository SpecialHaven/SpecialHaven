class TextPostsController < ApplicationController
	def new
		@post = current_user.text_posts.new
	end

	def show
    	@post = TextPost.find(params[:id])
    	@comments = @post.comments
  	end

	def create
		@post = current_user.text_posts.new(text_post_params)
		@post.user = current_user
		if @post.save
			flash[:notice] = "Post created successfully."
			redirect_to '/timeline'
		else
			flash[:notice] = "Please try posting again."
			redirect_to :back
		end
	end

	private

		def text_post_params
			params.require(:text_post).permit(:title, :body)
		end
end
