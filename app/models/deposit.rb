class Deposit < ApplicationRecord
  monetize :amount_cents, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user

  def enroll(direction, sum)
    case direction
    when 'loss'
      self.amount -= sum
      save!
    when 'profit'
      self.amount += sum
      save!
    else
      raise 'Unknown direction'
    end
  end
end
