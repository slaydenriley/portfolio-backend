class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      post = Post.find_by(id: comment.post_id)
      render json: PostSerializer.new(post).to_serialized_json
    else
      payload = {
        error: "Something went wrong. Please try again.",
        status: 400
      }
      render :json => payload, :status => :bad_request
    end
  end

  def destroy
    comment = Comment.find_by(id: comment_params[:id])
    post = Post.find_by(id: comment_params[:post_id])
      if comment.user_id == current_user.id
        if comment.destroy
          render json: PostSerializer.new(post).to_serialized_json
        else
          payload = {
            error: "Something went wrong. Please try again.",
            status: 400
          }
          render :json => payload, :status => :bad_request
        end
      else
        payload = {
          error: "You don't own this comment!",
          status: 400
        }
      end
  end

  private

  def comment_params
    params.require(:comment).permit(
      :id,
      :content,
      :post_id,
      :user_id
    )
  end

end
