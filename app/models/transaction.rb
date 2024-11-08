class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :financial_asset
end
