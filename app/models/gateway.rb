class Gateway < ApplicationRecord
  include Tokenable

  validates :name, presence: true
end
