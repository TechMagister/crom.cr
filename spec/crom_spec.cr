require "./spec_helper"

class TestModel
  CROM.mapping([] of Symbol, {
    name: String,
    age:  Int32,
  })
end

class FakeAdapter < CROM::Adapter
  def initialize(@uri : URI, **options)
  end
end

describe CROM do
  it "should create mapping" do
    tm = TestModel.new(name: "Toto", age: 10)
    tm.name.should eq("Toto")
    tm.age.should eq(10)
  end

  it "should register and adapter" do
    CROM.adapters.size.should eq(0)
    CROM.register_adapter "fake", FakeAdapter
    CROM.adapters.size.should eq(1)
    CROM.adapters["fake"].should eq(FakeAdapter)
  end

  it "should create a container" do
    crom = CROM.container "fake://"
    crom.should_not be_nil
  end
end
