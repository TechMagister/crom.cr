module CROM
  abstract class Gateway
    abstract def initialize(uri, **options)
    abstract def insert(**args)
    abstract def update(**args)
    abstract def delete(**args)
  end
end
