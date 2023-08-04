class PostsController < ApplicationController
  include Pagination

  before_action :authorize_request

  def index
    params = pagination_params
    collection = Post.all
    @pagination, @posts = paginate(collection, params)
    render json: { posts: @posts, pagination: @pagination }
  end

  def create
    post = Post.create!(post_params)
    render json: post, status: :created
  end

  def update
    post = Post.find(params[:id])
    post.update!(post_params)
    render json: post, status: :ok
  end

  def show
    render json: Post.find(params[:id]), status: :ok
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    render json: post, status: :ok
  end

  def post_params
    params.permit(:title, :content).with_defaults(user_id: @current_user.id)
  end
end
