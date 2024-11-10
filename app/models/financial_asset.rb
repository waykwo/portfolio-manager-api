class FinancialAsset < ApplicationRecord
  validates :ticker, presence: true, uniqueness: true
  has_many :transactions
  # has_one :transaction
end
