class OrderStatus < ApplicationRecord
  enum status: {
      waiting_payment: 0,
      paid: 1,
      shipped: 2,
      delivered: 3,
      canceled: 4
  }
end