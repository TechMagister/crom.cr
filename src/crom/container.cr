module CROM
  class Container
    @uri : String
    @adapter_class : CROM::Adapter.class
    @adapter : CROM::Adapter

    def initialize(@adapter_class, @uri)
      @adapter = @adapter_class.new(@uri)
    end

    forward_missing_to @adapter
  end
end
