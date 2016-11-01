require "./spec_helper"

describe CROM do
  it "should create mapping" do
    TestModel.should be_a(CROM::Model)
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
