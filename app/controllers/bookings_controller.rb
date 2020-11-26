class BookingsController < ApplicationController
  def show
    @booking =Booking.find(params[:id])
    @skill = Skill.find(params[:skill_id])
    authorize @booking
  end

  def new
    @skill = Skill.find(params[:skill_id])
    @bookings_dates = @skill.bookings.map do |booking|
      {
        from: booking.date_in,
        to: booking.date_out
      }
    end
    @booking = Booking.new
    authorize @booking
  end

  def create
    @skill = Skill.find(params[:skill_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.status = "pending"
    @booking.skill = @skill

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

    @booking.update(status: "accepted")
    redirect_to skill_booking_path
  end

  def cancel
    @booking = Booking.find(params[:id])
    authorize @booking

    @booking.update(status: "cancelled")
    redirect_to skill_booking_path
  end

  def users_bookings
    @users_skills = current_user.skills
    @users_skills = @users_skills.to_a.map { |skill| skill.bookings.to_a }.to_a
    @users_skills.each { |bookings_skill| bookings_skill.each do |booking|
      authorize booking
    end
  }
  end

  def my_bookings
    @user_bookings = current_user.bookings
    @user_bookings.each { |booking| authorize booking }
  end

  private

  def booking_params
    params.require(:booking).permit(:date_in, :date_out)
  end
end
