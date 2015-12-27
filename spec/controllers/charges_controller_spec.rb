require 'rails_helper'
require 'stripe_mock'

RSpec.describe ChargesController, type: :controller do

  describe "Purchasing premium membership" do
    let(:stripe_helper) { StripeMock.create_test_helper }
    let(:standard_user) { create(:user)}
    let(:premium_user) { create(:user, role: :premium)}

    before { StripeMock.start }
    after { StripeMock.stop }

    context "standard user upgrading to premium account" do
      before(:each) do
        sign_in standard_user

        @customer = Stripe::Customer.create({
          email: standard_user.email,
          card: stripe_helper.generate_card_token
        })
      end

      it 'creates a stripe customer' do
        expect(@customer.email).to eq(standard_user.email)
      end

      it 'allows standard user to upgrade to premium user' do

      end

    end

    context "preimum user or admin user upgrading to premium account" do
      before(:each) do
        sign_in premium_user
      end

    end
  end
end
