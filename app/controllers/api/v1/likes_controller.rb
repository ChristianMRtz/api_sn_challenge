class Api::V1::LikesController < ApplicationController

  def index
    @likes = Like.all
    render json: @likes
  end

  def create
    @like = current_user.likes.new(like_params)
      if !@like.save
        render json: @like.errors, status: :unprocessable_entity
      end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    post = @like.post
    @like.destroy
  end

  private
  def like_params
    params.require(:like).permit(:post_id)
  end

end
