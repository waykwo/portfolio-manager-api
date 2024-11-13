class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :financial_asset
  before_save :calc_book_value

  def calc_book_value
    self.book_value = shares.to_d * cost_per_share.to_d
  end

  def current_value
    return financial_asset.latest_price.to_d * shares.to_d
  end

  def gain_loss
    return financial_asset.latest_price.to_d * shares.to_d - book_value.to_d
  end

end
