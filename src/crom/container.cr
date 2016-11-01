require "uri"

module CROM
  class Container
    @uri : URI
    @adapter_class : CROM::Adapter.class
    @adapter : CROM::Adapter

    getter :adapter

    def initialize(uri, **options)
      @uri = URI.parse(uri)
      @adapter_class = CROM.adapters[@uri.scheme]
      @adapter = @adapter_class.new(@uri, **options)
    end

    forward_missing_to @adapter
  end
end
