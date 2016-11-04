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

  it "should register a repository" do 
    testrepo = TestRepo.new CROM.container("fake://")
    CROM.repository(:testrepo).should be_nil
    CROM.register_repository(:testrepo, testrepo)
    CROM.repository(:testrepo).should eq(testrepo)
  end

end
