class StripeCheckoutSessionService
    def call(event)
      booking = Booking.find_by(checkout_session_id: event.data.object.id)
      booking.update(status: 'paid')
    end
  end