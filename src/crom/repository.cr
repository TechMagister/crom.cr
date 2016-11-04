module CROM

  

  abstract class Repository(T)

    macro def_repo_method(name)

      # execute the do_{{name.id}} method and call model.after_{{name.id}} if defined
      def {{name.id}}(model : T)
        ret = do_{{name.id}}(model)
        do_after_{{name.id}} model, ret
      end

      # check if the method after_{{name.id}} exists and call it
      def do_after_{{name.id}}(model : T, *args)
        if model.responds_to? :after_{{name.id}}
          model.after_{{name.id}} *args
        end
      end

    end

    macro model(classname)
      @model_class : CROM::Model = {{classname}}
    end

    getter container, model

    
    # Method used to get a model by id
    #
    # ```
    # model = repository[12]
    # if mymodel = model
    #   # do stuff with mymodel
    # end
    # ```
    abstract def [](id)

    # Get all the models in the repository
    abstract def all

    # execute insert operation
    abstract def do_insert(model : T, *args)

    #execute update
    abstract def do_update(model : T, *args)

    # execute delete
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
