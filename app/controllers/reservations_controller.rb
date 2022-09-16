class ReservationsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    myhash = params.require(:reservation).permit(:city, :date, :item)
    myitem = Item.where(name: myhash['item']).first
    new_reserv = Reservation.new(city: myhash['city'], date: myhash['date'], item: myitem)
    new_reserv.user = current_user
    if new_reserv.save
      render json: new_reserv, status: :created
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def index
    @reservations = current_user.reservations
    render json: @reservations
  end
end

