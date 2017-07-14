class PaymentController < ApplicationController
  before_action :check_token
  before_action :sanitize_create_params, only: :create

  def create
    @deposit = Deposit.find(params[:deposit_id])

    ActiveRecord::Base.transaction do
      begin
        @transaction = Transaction.create(
          deposit: @deposit,
          direction: params[:direction],
          amount: params[:amount]
        )
        @transaction.gateway = @gateway
        @transaction.save!
        @deposit.enroll(@transaction.direction, @transaction.amount)
        render status: 200, plain: 'Success'
      #rescue ActiveRecord::StatementInvalid => e
        #render status: 400, json: { error: e.message }
      rescue
        render status: 400, json: { error: 'Sorry, something went wrong' }
      end
    end
  end

  private

  def sanitize_create_params
    params[:direction] = params[:direction].to_i
    params[:amount] = Money.new(params[:amount])
  end

  def check_token
    @gateway = Gateway.find_by(access_token: params[:access_token])

    render status: 401, plain: 'Unauthorized' if @gateway.nil?
  end
end
