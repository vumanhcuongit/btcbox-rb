module BtcBox
  module Executions
    def self.all(options = {})
      BtcBox.sanity_check!
      executions = BtcBox::Net.post("/v1/trade_list", options)
      JSON.parse(executions).map do |execution|
        BtcBox::Execution.new(execution)
      end
    end
  end
end