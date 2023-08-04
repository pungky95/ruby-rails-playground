class CommentsController < ApplicationController
  include Pagination
  before_action :authorize_request

  def index
    params = pagination_params
    collection = Comment.all
    @pagination, @comments = paginate(collection, params)
    render json: { comments: @comments, pagination: @pagination }
  end

  def show
    render json: Comment.find(params[:id]), status: :ok
  end

  def create
    comment = Comment.create!(comment_params)
    render json: comment, status: :created
  end

  def update
    comment = Comment.find(params[:id])
    comment.update!(comment_params)
    render json: comment, status: :ok
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render json: comment, status: :ok
  end

  private

  def comment_params
    params.permit(:comment, :post_id).with_defaults(user_id: @current_user.id)
  end
end
