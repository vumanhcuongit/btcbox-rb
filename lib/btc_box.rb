require "btc_box/version"
require "btc_box/net"
require "btc_box/model"
require "btc_box/orders"
require "btc_box/executions"
require "btc_box/balances"

module BtcBox
  class << self
    # API Key
    attr_accessor :key
    # API secret
    attr_accessor :secret
  end

  def self.setup
    yield self
  end

  def self.configured?
    key && secret
  end

  def self.sanity_check!
    unless configured?
      raise MissingConfigExeception.new("BtcBox Gem not properly configured")
    end
  end

  class MissingConfigExeception < RuntimeError; end
end