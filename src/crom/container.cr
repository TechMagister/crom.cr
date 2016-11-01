require "uri"

module CROM
  class Container
    @uri : URI
    @adapter_class : CROM::Adapter.class
    @adapter : CROM::Adapter

    def initialize(uri)
      @uri = URI.parse(uri)
      @adapter_class = CROM.adapters[@uri.scheme]
      @adapter = @adapter_class.new(@uri)
    end

    forward_missing_to @adapter
  end
end
