require "./spec_helper"

class TestRepo < CROM::Repository(TestModel)
  
end

testrepo = TestRepo.new CROM.container("fake://")

describe CROM::Repository do

  it "should call after_delete" do

    model = TestModel.new("Fakename", 10)

    model.delete.should be_false

    testrepo.delete model

    model.delete.should be_true

  end

end