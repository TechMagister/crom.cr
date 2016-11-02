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
end
