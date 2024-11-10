class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :financial_asset
  before_save :calc_subtotal
  
  def calc_subtotal
    self.subtotal = shares.to_d * cost_per_share.to_d
  end

end
