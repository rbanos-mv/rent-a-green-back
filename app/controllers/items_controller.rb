class ItemsController < ApplicationController
  before_action :authenticate_user!, only: %i[create toggle_active]

  def index
    @items = Item.where(active: true)

    render json: @items
  end

  def show
    @item = Item.find(params[:id])
    render json: @item
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      render json: @item, status: :created
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.active = false

    if @item.save
      render json: {
        status: 200,
        message: 'deleted successfully'
      }, status: :ok
    else
      render json: {
        status: 404,
        message: 'not found'
      }, status: :unauthorized
    end
  end

  def toggle_active
    @item = Item.find(params[:id])
    @item.toggle!(:active)

    if @item.save
      render json: @item, status: :accepted
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :photo, :description, :range)
  end
end
