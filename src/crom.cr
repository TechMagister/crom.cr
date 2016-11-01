require "./crom/*"

module CROM
  @@adapters = Hash(String, Adapter.class).new

  def self.register_adapter(name : String, adapter : Adapter.class)
    @@adapters[name] = adapter
  end

  def self.adapters
    @@adapters.dup
  end

  def self.container(uri : String, **options)
    CROM::Container.new uri, **options
  end
end
