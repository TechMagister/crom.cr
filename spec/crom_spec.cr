require "./spec_helper"

class TestModel
  CROM.mapping([] of Symbol, {
    name: String,
    age:  Int32,
  })
end

describe CROM do
  it "should create mapping" do
    tm = TestModel.new(name: "Toto", age: 10)
    tm.name.should eq("Toto")
    tm.age.should eq(10)
  end
end
