module CROM

  module AbstractRepo end

  abstract class Repository(T)

    include AbstractRepo

    # macro used to define insert, update, delete methods
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

    macro commands(*methods)
      {% for method in methods %}
        def self.{{method.id}}(*args, **options)
          if repo = self.repo
            repo.{{method.id}}(*args, **options)
          else
            raise Exception.new("Repository not registered, use CROM.register_repository")
          end
        end

        def self.{{method.id}}(*args, **options)
          if repo = self.repo
            repo.{{method.id}}(*args, **options) do |*yield_args|
              yield *yield_args
            end
          else
            raise Exception.new("Repository not registered, use CROM.register_repository")
          end
        end
      {% end %}
    end

    # ----------

    # return {{@type.name.stringify}}
    def self.name
      {{@type.name.stringify}}
    end

    def self.repo
      if repo = CROM.repository(self.name)
        repo.as(self)
      end
    end

    getter container
    
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

    commands :[], :all, :insert, :update, :delete

  end
end
