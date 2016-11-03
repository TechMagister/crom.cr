module CROM

  

  abstract class Repository(T)

    macro def_repo_method(name)
      def {{name.id}}(model : T)
        ret = do_{{name.id}}(model)
        do_after_{{name.id}} model, ret
      end

      def do_after_{{name.id}}(model : T, *args)
        if model.responds_to? :after_{{name.id}}
          model.after_{{name.id}} *args
        end
      end

    end

    getter :container

    abstract def do_insert(model : T, *args)
    abstract def do_update(model : T, *args)
    abstract def do_delete(model : T, *args)


    def initialize(@container : CROM::Container)
    end

    def_repo_method :insert
    def_repo_method :update
    def_repo_method :delete

    #macro method_missing(call)
    #  container.gateway.{{call.name.id}}(T, {{call.args.argify}})
    #end
  end
end
