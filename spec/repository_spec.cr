require "./spec_helper"

class TestRepo < CROM::Repository(TestModel)
  def do_insert(model : T, *args) end
  def do_update(model : T, *args) end
  def do_delete(model : T, *args) end
  def [](id) end
  def all() end
end

testrepo = TestRepo.new CROM.container("fake://")

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