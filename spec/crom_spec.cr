require "./spec_helper"

describe CROM do
  it "should create mapping" do
    TestModel.should be_a(CROM::Model)
    TestModel.dataset.should eq("test_model")
    tm = TestModel.new(name: "Toto", age: 10)
    tm.name.should eq("Toto")
    tm.age.should eq(10)
  end

  it "should create a container" do
    crom = CROM.container "fake://"
    crom.should_not be_nil
  end

end
