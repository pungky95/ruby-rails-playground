class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  private

  def render_not_found_response
    render json: { error: "User not found" }, status: :not_found
  end

  def render_unprocessable_entity_response
    render json: { error: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  def index
    render json: User.all
  end

  def show
    render json: User.Find(params[:id])
  end

  def create
    user = User.create(user_params)
    if user.valid?
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password)
  end
end
