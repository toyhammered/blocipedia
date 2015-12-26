class ChargesController < ApplicationController
  def new
    unless current_user.premium? || current_user.admin?
      @stripe_btn_data = {
       key: "#{ Rails.configuration.stripe[:publishable_key] }",
       description: "Blocipedia Premium Membership - #{current_user.email}",
       amount: 1500
      }
     else
       flash[:error] = "It seems like you are already a premium member or admin."
       redirect_to user_path(current_user)
     end

  end

  def create

      # Creates a Stripe Customer object, for associating
      # with the charge
      customer = Stripe::Customer.create(
        email: current_user.email,
        card: params[:stripeToken]
      )

      # Where the real magic happens
      charge = Stripe::Charge.create(
        customer: customer.id, # Note -- this is NOT the user_id in your app
        amount: 1500,
        description: "Blocipedia Premium Membership - #{current_user.email}",
        currency: 'usd'
      )

      flash[:notice] = "Thanks for buying a premium membership #{current_user.email}! You are now able to create private wikis!"

      current_user.update_attributes(role: :premium)
      redirect_to user_path(current_user) # or wherever

    # Stripe will send back CardErrors, with friendly messages
    # when something goes wrong.
    # This `rescue block` catches and displays those errors.
    rescue Stripe::CardError => e
     flash[:error] = e.message
     redirect_to new_charge_path
  end

end
