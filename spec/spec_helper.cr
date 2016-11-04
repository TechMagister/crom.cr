require "spec"
require "../src/crom"


class FakeAdapter < CROM::Gateway

  def initialize(@uri : URI, **options)
  end

  def insert(**args)
  end

  def update(**args)
  end

  def delete(**args)
  end
end

module CROM
  macro fake_adapter(properties)

    @delete = false
    @insert = false
    @update = false
    getter delete, insert, update

    def after_delete(arg)
      @delete = true
    end

    def after_insert(arg)
      @insert = true
    end

    def after_update(arg)
      @update = true
    end

  end
end

class TestModel
  CROM.mapping(:fake, {
    name: String,
    age:  Int32,
  })
end

class TestRepo < CROM::Repository(TestModel)
  def do_insert(model : T, *args) end
  def do_update(model : T, *args) end
  def do_delete(model : T, *args) end
  def [](id) end
  def all() end
end

CROM.register_adapter("fake", FakeAdapter)