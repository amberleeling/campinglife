class Owner::EquipmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @equipments = current_user.equipments
  end
end
