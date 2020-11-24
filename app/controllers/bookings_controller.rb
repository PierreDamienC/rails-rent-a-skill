class BookingsController < ApplicationController
  def show
    @booking =Booking.find(params[:id])
    @skill = Skill.find(params[:skill_id])
    authorize @booking
  end

  def new
    @skill = Skill.find(params[:skill_id])
    @booking = Booking.new
    authorize @booking
    
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.accepted = false

    authorize @booking

    if @booking.save
      redirect_to skill_booking_path(params[:skill_id], @booking)
    else
      render :new
    end
  end

  def validate
    @booking = Booking.find(params[:id])
    authorize @booking

    @booking.update(accepted: true)
    redirect_to skill_booking_path
  end

  private 

  def booking_params
    params.require(:booking).permit(:date_in, :date_out)
  end
end
