class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  enum making_status: { impossible: 0, waiting: 1 , production:2, completion:3}

  def with_tax_price
    (price * 1.1).floor
  end

end
