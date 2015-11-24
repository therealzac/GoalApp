class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.new(comment_params)

    @comment.save!
    flash[:errors] = @comment.errors.full_messages
    redirect_to goal_url(@comment.goal)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to goal_url(@comment.goal)
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :goal_id)
  end
end
