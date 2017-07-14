class Transaction < ApplicationRecord
  belongs_to :deposit
  belongs_to :gateway

  enum direction: { profit:  0, loss: 1 }
  monetize :amount_cents, numericality: { greater_than_or_equal_to: 0 }

  attr_accessor :comment
end
