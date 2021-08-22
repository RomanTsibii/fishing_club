class PaymentsController < ApplicationController
  before_action :set_payment

  def active
    @payment.update(purchased_at: DateTime.current)
    # TODO: set notification
    redirect_to user_path(params[:user_id])
  end

  def inactive
    @payment.update(purchased_at: nil)
    # TODO: set notification
    redirect_to user_path(params[:user_id])
  end

  private

  def set_payment
    @payment = Payment.find(params[:payment_id])
  end
end
