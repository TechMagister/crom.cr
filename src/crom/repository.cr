module CROM
  abstract class Repository(T)

    getter :container

    def initialize(@container : CROM::Container)
    end

    def insert(model : T)
      ret = container.gateway.insert(T, model.to_crom)
      if model.responds_to?(:after_insert)
        model.after_insert ret
      end
    end

    def update(model : T)
      ret = container.gateway.update(T, model.to_crom)
      if model.responds_to?(:after_update)
        model.after_update ret
      end
    end

    def delete(model : T)
      container.gateway.delete(T, model.to_crom)
      if model.responds_to?(:after_delete)
        model.after_delete
      end
    end

    macro method_missing(call)
      container.gateway.{{call.name.id}}(T, {{call.args.argify}})
    end
  end
end
