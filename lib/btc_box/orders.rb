module BtcBox
  module Orders
    def self.create(options = {})
      BtcBox.sanity_check!
      result = BtcBox::Net.post("/v1/trade_add", options)
      BtcBox::Order.new(JSON.parse(result))
    end

    def self.cancel(options = {})
      BtcBox.sanity_check!
      BtcBox::Net.post("/v1/trade_cancel", options)
    end
  end
end