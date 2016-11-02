require "spec"
require "../src/crom"


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

module CROM
  macro fake_adapter(properties)
  end
end

class TestModel
  CROM.mapping(:fake, {
    name: String,
    age:  Int32,
  })
end