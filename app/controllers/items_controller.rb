class ItemsController < ApplicationController
  before_action :authenticate_user!, only: %i[create toggle_active]

  def index
    @items = Item.all

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
