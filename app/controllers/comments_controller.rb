class CommentsController < ApplicationController

  def create
     @comment = current_user.comments.build(comment_params.merge(micropost_id:
      params[:micropost_id]))
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to :back
    else
      render 'static_pages/home'
    end
  end

   private

    def comment_params
      params.require(:comment).permit(:content)
    end
end
