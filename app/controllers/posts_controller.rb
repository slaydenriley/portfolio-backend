class PostsController < ApplicationController
  def create
    post = Post.new(post_params)
    tags = params[:tags]
    if post.save
      tags.each do |tag|
        assign = Tag.find_by(id: tag.to_i)
        post.tags << assign
      end
      render json: PostSerializer.new(post).to_serialized_json
    else
      payload = {
        error: "Something went wrong. Please try again.",
        status: 400
      }
      render :json => payload, :status => :bad_request
    end
  end

  def show
    post = Post.find_by(id: params[:id])
    render json: PostSerializer.new(post).to_serialized_json
  end

  def index
    posts = Post.all
    render json: PostSerializer.new(posts).to_small_json
  end

  def update
    post = Post.find_by(id: post_params[:id])
    if post.update(post_params)
      if params[:tags].size != 0
        tags = params[:tags]
        post.tags.delete_all
        tags.each do |tag|
          assign = Tag.find_by(id: tag.to_i)
          post.tags << assign
        end
      end
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
    post = Post.find_by(id: post_params[:id])
      if post.destroy
        posts = Post.all
        render json: PostSerializer.new(posts).to_serialized_json
      else
        payload = {
          error: "Something went wrong. Please try again.",
          status: 400
        }
        render :json => payload, :status => :bad_request
      end
  end

  private

  def post_params
    params.require(:post).permit(
      :title,
      :content,
      :user_id,
      :category,
      :id,
      :image_link,
      tags:[]
    )
  end

end
