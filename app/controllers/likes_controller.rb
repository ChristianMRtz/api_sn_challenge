class LikesController < ApplicationController
  def index
    @likes = Like.all
    render json: @likes.to_json(only: [:id, :user_id, :post_id])
  end
  def create
    @like = Like.new(:user_id, :post_id)
    if !@like.save
      render json: @like.errors.full_messages.to_sentence, status: :unprocessable_entity
    end
  end
  def destroy
    @like.destroy
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @like = Like.find(params[:id])
  end
end
