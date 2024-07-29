class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @mission = Mission.find(params[:mission_id])
    @comment = @mission.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to mission_path(@mission), notice: "コメントが追加されました。"
    else
      redirect_to mission_path(@mission), alert: "コメントの追加に失敗しました。"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end