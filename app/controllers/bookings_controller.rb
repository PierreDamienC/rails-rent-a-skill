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
    @skill = Skill.find(params[:skill_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.accepted = false
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

    @booking.update(accepted: true)
    redirect_to skill_booking_path
  end

  def users_bookings
    @user = User.find(current_user.id)
    @users_skills = current_user.skills
    @users_skills = @users_skills.to_a.map { |skill| skill.bookings.to_a }.to_a
    @users_skills.each { |bookings_skill| bookings_skill.each do |booking|
      authorize booking
    end
  }
  end

  private

  def booking_params
    params.require(:booking).permit(:date_in, :date_out)
  end
end
