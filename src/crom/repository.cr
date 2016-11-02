module CROM
  abstract class Repository(T)
    @model : Model

    getter :container

    def initialize(@container : CROM::Container)
      @model = T
    end

    def insert(model : T)
      ret = container.adapter.insert(T, model.to_crom)
      if model.responds_to?(:after_insert)
        model.after_insert ret
      end
    end

    def update(model : T)
      ret = container.adapter.update(T, model.to_crom)
      if model.responds_to?(:after_update)
        model.after_update ret
      end
    end

    def delete(model : T)
      container.adapter.delete(T, model.to_crom)
      if model.responds_to?(:after_delete)
        model.after_delete
      end
    end

    macro method_missing(call)
      container.adapter.{{call.name.id}}(T, {{call.args.argify}})
    end
  end
end
