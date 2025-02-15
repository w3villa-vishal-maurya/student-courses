class PaymentService
  binding.pry
    def self.process_payment(course, user, payment_intent)
      binding.pry
      payment = Payment.new(
        student_id: user.id,
        status: Payment.statuses["paid"],
        total_payment: payment_intent.amount.to_i,
        payment_type: :card,
        course_id: course.id,
      )
      payment.save ? [true, payment] : [false, payment]
    end
  end
  