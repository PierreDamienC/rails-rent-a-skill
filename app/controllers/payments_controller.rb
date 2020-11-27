class PaymentsController < ApplicationController
  def new
    @booking = current_user.bookings.where(status: "accepted - Time to pay").find(params[:booking_id])
    authorize @booking
  end
end
