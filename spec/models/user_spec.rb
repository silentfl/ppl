require 'rails_helper'

RSpec.describe User, type: :model do
  describe :validations do
    it { expect(build(:user).valid?).to eq(true) }

    context 'uniq fields' do
      before { create(:user) }
      it { expect(build(:user).valid?).to eq(false) }
    end

    context :names do
      it { expect(build(:user, firstname: '').valid?).to eq(false) }
      it { expect(build(:user, middlename: '').valid?).to eq(false) }
      it { expect(build(:user, lastname: '').valid?).to eq(false) }
    end
  end

  describe :functions do
    subject { build(:user) }

    it { expect(subject.fullname).to match(/^#{subject.lastname}/) }
    it { expect(subject.fullname).to match(/#{subject.firstname}/) }
    it { expect(subject.fullname).to match(/#{subject.middlename}$/) }
  end
end
