class UserCabinetController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @deposit = current_user.deposit
  end
end
