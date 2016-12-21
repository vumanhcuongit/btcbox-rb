require "virtus"

module BtcBox
  class Order
    include Virtus.value_object

    values do
      attribute :id, String
    end
  end

  class Execution
    include Virtus.value_object

    values do
      attribute :id, String
      attribute :price, Decimal
      attribute :amount_original, Decimal
      attribute :amount_outstanding, Decimal
      attribute :datetime, String
      attribute :type, String
    end
  end

  class Balance
    include Virtus.value_object

    values do
      attribute :jpy_balance, Decimal
      attribute :btc_balance, Decimal
      attribute :jpy_lock, Decimal
      attribute :btc_lock, Decimal
    end
  end
end