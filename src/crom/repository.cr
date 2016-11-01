module CROM
  abstract class Repository(T)
    @model : Model

    getter :container

    def initialize(@container : CROM::Container)
      @model = T
    end

    abstract def create(model : T)
    abstract def update(model : T)
    abstract def delete(model : T)
    abstract def persist
  end
end
