require "spec"
require "../src/crom"

class TestModel
  CROM.mapping({
    name: String,
    age:  Int32,
  })
end

class FakeAdapter < CROM::Adapter
  def initialize(@uri : URI, **options)
  end

  def insert(dataset, namedtuple)
  end

  def update(dataset, namedtuple)
  end

  def delete(dataset, namedtuple)
  end
end
