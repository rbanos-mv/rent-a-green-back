class UsersController < ApplicationController
  before_action :authenticate_user!

  def current
    render json: current_user.slice(:id, :name, :email), status: :ok
  end
end
