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
    @booking.amount_cents = @booking.skill.price_cents * (@booking.date_out - @booking.date_in).numerator
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

    @booking.update(status: "accepted - Time to pay")
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

  def pay
    @booking =Booking.find(params[:id])
    @skill = Skill.find(params[:skill_id])
    authorize @booking

    session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
    name: @booking.skill.name,
    # images: [cl_image_path (@booking.skill.photo.attachment)],
    amount: @booking.amount_cents,
    currency: 'eur',
    quantity: 1
    }],
    success_url: booking_url(@booking),
    cancel_url: booking_url(@booking)
          )

    redirect_to skill_booking_path(params[:skill_id], @booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:date_in, :date_out)
  end
end
