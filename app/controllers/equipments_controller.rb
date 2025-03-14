class EquipmentsController < ApplicationController
  before_action :set_equipment, only: [:show]

  def index
    if params[:address].present?
      @equipments = Equipment.near(params[:address])
    else
      @equipments = Equipment.all
    end

    @equipment_images = ["camping00.jpg", "camping01.jpg", "camping02.jpg", "camping03.jpg", "camping04.jpg", "camping05.jpg"]

    @markers = @equipments.geocoded.map do |equipment|
      {
        lat: equipment.latitude,
        lng: equipment.longitude
      }
    end
  end


  def show
    @booking = Booking.new
  end

  def new
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.new(equipment_params)

    if @equipment.save
      redirect_to equipments_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_equipment
    @equipment = Equipment.find(params[:id])
  end

  def equipment_params
    params.require(:equipment).permit(:name, :description, :price_per_day, :location, :owner_id)
  end
end
