require "./spec_helper"

testrepo = TestRepo.new CROM.container("fake://")
CROM.register_repository(testrepo)

describe CROM::Repository do

  it "should call after_delete" do
    model = TestModel.new("Fakename", 10)

    model.delete.should be_false
    TestRepo.delete model
    model.delete.should be_true
  end

  it "should call after_insert" do
    model = TestModel.new("Fakename", 10)

    model.insert.should be_false
    TestRepo.insert model
    model.insert.should be_true
  end

  it "should call after_update" do
    model = TestModel.new("Fakename", 10)

    model.update.should be_false
    TestRepo.update model
    model.update.should be_true
  end

end