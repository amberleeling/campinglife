class BookingsController < ApplicationController
  before_action :set_equipment, only: [:create]  # ✅ This ensures `@equipment` is set before `create`
  before_action :set_booking, only: [:accept, :decline, :destroy]

  def create
    @booking = @equipment.bookings.build(booking_params)  # ✅ Associate booking with equipment
    @booking.user = current_user  # ✅ Assign the booking to the current user

    if @booking.save
      redirect_to client_bookings_path, notice: "Booking confirmed!"
    else
      render "equipments/show", status: :unprocessable_entity
    end
  end

  def accept
    @booking.update(status: "accepted")
    redirect_to owner_bookings_path, notice: "Booking accepted!"
  end

  def decline
    @booking.update(status: "declined")
    redirect_to owner_bookings_path, notice: "Booking declined!"
  end


  def destroy
    @booking.destroy
    redirect_to client_bookings_path, notice: "Booking successfully canceled."
  end


  private

  # ✅ This method was missing
  def set_equipment
    @equipment = Equipment.find(params[:equipment_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:first_name, :last_name, :phone, :start_date, :end_date)
  end
end
