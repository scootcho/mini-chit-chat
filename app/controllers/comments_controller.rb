class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @comments = Comment.order('created_at DESC')
  end

  def create
    if current_user
      @comment = current_user.comments.(comment_params)
      if @comment.save
        flash[:success] = "your comment was successfully posted!"
      else
        flash[:failure] = "your comment cannot be saved."
      end
    end
    redirect_to root_url    
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
