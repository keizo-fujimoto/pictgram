class CommentsController < ApplicationController
  #before_action :authenticate_user!

  def new
    @comment=Comment.new
  end
  
  
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.topic_id = params[:topic_id]
    if @comment.save!
      flash[:success] = "コメントしました"
      redirect_to topics_path, success: 'コメントに登録しました'
    else
      flash[:danger] = "コメントできませんでした"
      render :new
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end
end