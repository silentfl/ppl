require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it { expect(build(:transaction).valid?).to eq(true) }
  it { expect(build(:transaction, amount: Money.new(-10)).valid?).to eq(false) }
end
