class FinancialAsset < ApplicationRecord
  has_many :transactions
  # has_one :transaction
end
