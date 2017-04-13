require "jwt"

module Layer
  class IdentityToken
    class << self
      attr_writer :layer_provider_id,
                  :layer_key_id,
                  :layer_private_key

      def layer_provider_id
        @layer_provider_id || ENV["LAYER_PROVIDER_ID"]
      end

      def layer_key_id
        @layer_key_id || ENV["LAYER_KEY_ID"]
      end

      def layer_private_key
        @layer_private_key || ENV["LAYER_PRIVATE_KEY"]
      end
    end

    SUPPORTED_CLAIM_ATTRIBUTES = %w(first_name last_name display_name avatar_url metadata)

    attr_reader :user_id,
                :nonce,
                :expires_at,
                :more_claim_attributes

    def initialize(user_id, nonce, expires_at = (Time.now+(86400*14)),
                   more_claim_attributes = {})
      @user_id = user_id
      @nonce = nonce
      @expires_at = expires_at
      @more_claim_attributes = more_claim_attributes.select do |key, _value|
        SUPPORTED_CLAIM_ATTRIBUTES.include?(key.to_s)
      end
    end

    def encode
      JWT.encode(claim, private_key, "RS256", headers)
    end

    def as_json(options = {})
      encode
    end

    alias_method :to_s, :encode


  private

    def headers
      {
        typ: "JWT",
        cty: "layer-eit;v=1",
        kid: self.class.layer_key_id
      }
    end

    def claim
      more_claim_attributes.merge(
        iss: self.class.layer_provider_id,
        prn: user_id.to_s,
        iat: Time.now.to_i,
        exp: expires_at.to_i,
        nce: nonce
      )
    end

    def private_key
      OpenSSL::PKey::RSA.new(self.class.layer_private_key)
    end
  end
end
