require "./spec_helper"

describe CROM::Container do
  it "should register a model" do
    crom = CROM.container "fake://"
    crom.models.size.should eq(0)
    crom.register_model :testmodel, TestModel
    crom.models.size.should eq(1)
    crom.models["testmodel"].should eq(TestModel)
  end
end
