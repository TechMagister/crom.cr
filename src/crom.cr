require "./crom/*"

module CROM
  @@adapters = Hash(String, Gateway.class).new
  @@repositories = Hash(String, AbstractRepo).new

  def self.register_adapter(name : String, adapter : Gateway.class)
    @@adapters[name] = adapter
  end

  def self.adapters
    @@adapters.dup
  end

  def self.register_repository(name : String|Symbol, repository : AbstractRepo)
    @@repositories[name.to_s] = repository
  end

  def self.repository(name)
    @@repositories[name.to_s]?
  end

  def self.container(uri : String, **options)
    CROM::Container.new uri, **options
  end
end
