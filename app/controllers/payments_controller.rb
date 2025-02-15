class PaymentsController < ApplicationController

  def new
    @course = Course.find(params[:course_id])
  end

  def create
    @course = Course.find(params[:course_id])
    begin
      stripe_customer = StripeService.create_or_retrieve_customer(current_user)
      payment_intent = StripeService.create_payment_intent(current_user, @course)
      
      if payment_intent.status == "succeeded"
        success, @payment = PaymentService.process_payment(@course, current_user, payment_intent)
        if success
          redirect_to root_url, notice: 'Payment was successfully created.'
        else
          render :new, status: :unprocessable_entity
        end
      else
        flash[:error] = 'Payment failed'
        redirect_to root_url, status: :unprocessable_entity
      end
    rescue Stripe::StripeError => e
      flash[:error] = e.message
      redirect_to root_url, status: :unprocessable_entity
    end
  end
      
  def success
    #handle successful payments
    redirect_to root_url, notice: "Purchase Successful"
  end
  
  def cancel
    #handle if the payment is cancelled
    redirect_to root_url, notice: "Purchase Unsuccessful"
  end
end
