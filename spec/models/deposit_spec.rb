require 'rails_helper'

RSpec.describe Deposit, type: :model do
  describe :validations do
    it { expect(build(:deposit).valid?).to eq(true) }
    it { expect(build(:deposit, amount_cents: -1).valid?).to eq(false) }
  end
end
