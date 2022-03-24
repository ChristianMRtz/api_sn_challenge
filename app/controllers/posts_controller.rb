class PostsController < ApplicationController
  before_action :set_post, only: %i[ show update destroy ]

  # GET /posts
  def index
    @posts = Post.all
    render json: @posts.as_json(include: { user: { only: [:id, :username, :email, :avatar] },
                                           comments:{ include: {user:{only: [:username, :email, :avatar]} }  } })
  end

  # GET /posts/1
  def show
    render json: @post.attributes.merge(email: @post.user.email,
                                        username: @post.user.username,
                                        user_id: @post.user.id,
                                        comments: @post.comments.as_json(include: { user: { only: [:username, :email, :avatar]}}),
                                        dislikes: @post.dislikes,
                                        avatar: @post.user.avatar)                                       
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:body, :user_id)
    end
end
