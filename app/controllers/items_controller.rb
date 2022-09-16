class ItemsController < ApplicationController
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
      render json: @item, status: :updated
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :photo, :description, :range)
  end
end
