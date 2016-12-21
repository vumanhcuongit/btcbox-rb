module BtcBox
  module Balances
    def self.all
      BtcBox.sanity_check!
      balance = BtcBox::Net.post("/v1/balance", {}, true)
      BtcBox::Balance.new(balance)
    end
  end
end