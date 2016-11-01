module CROM
  abstract class Adapter
    abstract def initialize(uri, **options)
  end
end
