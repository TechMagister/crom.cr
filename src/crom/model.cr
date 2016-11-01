module CROM
  module Model
    def dataset
      {{@type.name.split(":").last.id.stringify.underscore}}
    end
  end
end
