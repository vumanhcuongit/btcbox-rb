require "rest_client"
require "net/http"
require "openssl"

module BtcBox
  module Net
    def self.to_uri(path)
      return "https://btcbox.co.jp/api#{path}"
    end

    def self.get(path, options = {}, private_api = false)
      begin
        if private_api
          RestClient.get(self.to_uri(path), process_signature(options))
        else
          RestClient.get(self.to_uri(path))
        end
      rescue RestClient::BadRequest => e
        raise BadRequest.new(e.response)
      end
    end

    def self.post(path, options = {})
      begin
        RestClient.post(self.to_uri(path), process_signature(options))
      rescue RestClient::BadRequest => e
        raise BadRequest.new(e.response)
      end
    end

    class BadRequest < RuntimeError; end

    private

    def self.process_signature(options)
      options["key"] = BtcBox.key
      options["nonce"] = (Time.now.to_f * 10000).to_i
      options["signature"] = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new("sha256"), Digest::MD5.hexdigest(BtcBox.secret), URI.encode_www_form(options))
      options
    end
  end
end
