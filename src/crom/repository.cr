module CROM
  abstract class Repository(T)
    @model : Model.class

    def initialize(@container : Container)
      @model = T
    end

    abstract def create(**attributes) : T
    abstract def update(model : T)
    abstract def delete(model : T)
  end
end
