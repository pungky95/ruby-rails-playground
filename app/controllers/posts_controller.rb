class PostsController < ApplicationController
  before_action :authorize_request

  def index
    render json: Post.all
  end

  def create
    puts post_params
    post = Post.create!(post_params)
    render json: post, status: :created
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
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
    params.permit(:title, :content).merge(user_id: @current_user.id)
  end
end
