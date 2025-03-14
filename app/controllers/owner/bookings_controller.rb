class Owner::BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookings = current_user.bookings_as_owner
  end
end
