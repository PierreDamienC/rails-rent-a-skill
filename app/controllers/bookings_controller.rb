class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @skill = Skill.find(params[:skill_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.skill = Skill.find(params[:skill_id])
    @booking.accepted = false

    if @booking.save
      redirect_to skill_booking_path(params[:skill_id] ,@booking)
    else
      render :new
    end
  end

  private 

  def booking_params
    params.require(:booking).permit(:date_in, :date_out)
  end
end
