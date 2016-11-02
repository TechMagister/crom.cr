module CROM
  abstract class Repository(T)
    @model : Model

    getter :container

    def initialize(@container : CROM::Container)
      @model = T
    end

    def insert(model : T)
      container.adapter.insert(T.dataset, model.to_crom)
    end

    def update(model : T)
      container.adapter.update(T.dataset, model.to_crom)
    end

    def delete(model : T)
      container.adapter.delete(T.dataset, model.to_crom)
    end

    macro method_missing(call)
      container.adapter.{{call.name.id}}(T, {{call.args.argify}})
    end
  end
end
