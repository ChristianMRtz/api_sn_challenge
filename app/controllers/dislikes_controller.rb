class DislikesController < ApplicationController
  def index
    @dislikes = Dislike.all
    render json: @dislikes.to_json(only: [:id, :user_id, :post_id])
  end
  def create
    @dislike = Dislike.new(:user_id, :post_id)
    if !@dislike.save
      render json: @dislike.errors.full_messages.to_sentence, status: :unprocessable_entity
    end
  end
  def destroy
    @dislike.destroy
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @dislike = Dislike.find(params[:id])
  end
end
