module CROM
  abstract class Adapter
    abstract def initialize(uri, **options)
    abstract def insert(dataset, namedtuple)
    abstract def update(dataset, namedtuple)
    abstract def delete(dataset, namedtuple)
  end
end
