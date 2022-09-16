class ReservationsController < ApplicationController
  def create
    myhash = params.require(:reservation).permit(:city, :date, :item)
    myitem = Item.where(name = myhash.item)
    new_reserv = Reservation.new(city: myhash.city, date: myhash.date, item: myitem)
    new_reserv.user = current_user
    if new_reserv.save
      render json: { message: "Reservation created successfully!" }
    else
      render json: { message: "Reservation is not valid." }
    end

  end
  
  def index
    @reservations = current_user.reservations
    render json: @reservations
  end
end
