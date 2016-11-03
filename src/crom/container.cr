require "uri"

module CROM
  class Container
    @uri : URI
    @gateway_class : CROM::Gateway.class
    @gateway : CROM::Gateway

    @models = Hash(String, Model).new

    getter :gateway, :uri, :models

    def initialize(uri, **options)
      @uri = URI.parse(uri)
      @gateway_class = CROM.adapters[@uri.scheme]
      @gateway = @gateway_class.new(@uri, **options)
    end

    def register_model(name : String | Symbol, mclass : Model)
      @models[name.to_s] = mclass
    end
  end
end
