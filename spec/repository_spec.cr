require "./spec_helper"


testrepo = TestRepo.new CROM.container("fake://"), TestModel

describe CROM::Repository do

  it "should call after_delete" do
    model = TestModel.new("Fakename", 10)

    model.delete.should be_false
    testrepo.delete model
    model.delete.should be_true
  end

  it "should call after_insert" do
    model = TestModel.new("Fakename", 10)

    model.insert.should be_false
    testrepo.insert model
    model.insert.should be_true
  end

  it "should call after_update" do
    model = TestModel.new("Fakename", 10)

    model.update.should be_false
    testrepo.update model
    model.update.should be_true
  end

end