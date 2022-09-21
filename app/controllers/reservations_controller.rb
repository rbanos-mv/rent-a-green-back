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
      render json: new_reserv.errors, status: :unprocessable_entity
    end
  end

  def index
    @reservations = current_user.reservations
    reservations_with_car_names = []
    @reservations.includes([:item]).each_with_index do |reservation, i|
      reservations_with_car_names[i] = JSON.parse(reservation.to_json)
      reservations_with_car_names[i][:carname] = reservation.item.name
    end
    p reservations_with_car_names
    render json: reservations_with_car_names
  end
end
