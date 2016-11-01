require "uri"

module CROM
  class Container
    @uri : URI
    @adapter_class : CROM::Adapter.class
    @adapter : CROM::Adapter

    @models = Hash(String, Model.class).new

    getter :adapter, :uri, :models

    def initialize(uri, **options)
      @uri = URI.parse(uri)
      @adapter_class = CROM.adapters[@uri.scheme]
      @adapter = @adapter_class.new(@uri, **options)
    end

    def register_model(name : String | Symbol, mclass : Model.class)
      @models[name.to_s] = mclass
    end

    forward_missing_to @adapter
  end
end
