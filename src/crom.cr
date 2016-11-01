require "./crom/*"

module CROM
  @@adapters = Hash(String, Adapter.class).new

  def self.register_adapter(name : String, adapter : Adapter.class)
    @@adapters[name] = adapter
  end

  def self.adapters
    @@adapters
  end
end
