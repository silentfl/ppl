require 'rails_helper'

RSpec.describe PaymentController, type: :controller do
  describe 'create payment' do
    let(:deposit) { create(:deposit) }
    let(:gateway) { create(:gateway) }
    let(:params) do
      {
        deposit_id: deposit.id,
        access_token: gateway.access_token,
        direction: rand(0..1),
        amount: 1000
      }
    end

    subject { post :create, params: params }

    it { expect(response).to have_http_status(:success) }
    it { expect { subject }.to change { Deposit.find(deposit.id).amount }.by(Money.new(1000)) }
  end
end
