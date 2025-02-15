class StripeService
    def self.create_or_retrieve_customer(user)
      if user.stripe_customer_id.present?
        customer = Stripe::Customer.retrieve(user.stripe_customer_id)
      else
        customer = Stripe::Customer.create({
          name: user.studFName,
          email: user.email
        })
        user.update(stripe_customer_id: customer.id)
        customer
      end
    end
  
    def self.create_payment_intent(user, course)
      Stripe::PaymentIntent.create({
        customer: user.stripe_customer_id,
        amount: (2 * 100).to_i,
        description: "Purchase this course only $ #{course.course_name}",
        currency: 'usd',
        automatic_payment_methods: { enabled: true, allow_redirects: 'never' },
        payment_method: 'pm_card_visa',
        confirm: true,
        return_url: 'http://localhost:3000/'
      })
    end
  end
  