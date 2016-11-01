require "uri"

module CROM
  class Container
    @uri : URI
    @adapter_class : CROM::Adapter.class
    @adapter : CROM::Adapter

    @models = Hash(String, Model).new

    getter :adapter, :uri, :models

    def initialize(uri, **options)
      @uri = URI.parse(uri)
      @adapter_class = CROM.adapters[@uri.scheme]
      @adapter = @adapter_class.new(@uri, **options)
    end

    def register_model(name : String | Symbol, mclass : Model)
      @models[name.to_s] = mclass
    end
  end
end
