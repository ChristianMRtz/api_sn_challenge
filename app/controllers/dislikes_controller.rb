class DislikesController < ApplicationController
  def create
    @dislike = current_user.dislikes.new(dislike_params)
    if !@dislike.save
      render json: @dislike.errors.full_messages.to_sentence, status: :unprocessable_entity
    end
  end
  def destroy
    @dislike = current_user.likes.find(params[:id])
    post = @dislike.post
    @dislike.destroy
  end
  private
    def dislike_params
      params.require(:dislike).permit(:post_id)
    end
end
