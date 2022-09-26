class CommentsController < ApplicationController
  #To prevent bot spam:
  invisible_captcha only: [:create], honeypot: :subtitle

  def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.create(comment_params)
    redirect_to topic_path(@topic)
  end
  
  def destroy
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@topic), status: :see_other
  end



  private
    def comment_params
      params.require(:comment).permit(:name, :body)
    end
end
