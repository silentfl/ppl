require 'rails_helper'

RSpec.describe Gateway, type: :model do
  describe :validations do
    it { expect(build(:gateway).valid?).to eq(true) }
    it { expect(build(:gateway, name: '').valid?).to eq(false) }
  end
end
