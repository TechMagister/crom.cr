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

  def self.register_repository(repository : AbstractRepo)
    @@repositories[repository.class.name] = repository
  end

  protected def self.repository(name : String|Symbol)
    @@repositories[name.to_s]?
  end

  def self.container(uri : String, **options)
    CROM::Container.new uri, **options
  end
end
