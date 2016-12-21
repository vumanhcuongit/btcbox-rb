module BtcBox
  module Balances
    def self.all
      BtcBox.sanity_check!
      balances = BtcBox::Net.post("/v1/balance", {}, true)

      JSON.parse(balances).map do |balance|
        BtcBox::Balance.new(balance)
      end
    end
  end
end