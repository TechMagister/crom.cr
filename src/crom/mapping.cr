module CROM
  macro mapping(adapters, properties)
    extend CROM::Model

    {% for key, value in properties %}
      {% properties[key] = {type: value} unless value.is_a?(HashLiteral) || value.is_a?(NamedTupleLiteral) %}
    {% end %}

    {% for key, value in properties %}
      @{{key.id}} : {{value[:type]}} {{ (value[:nilable] ? "?" : "").id }}

      def {{key.id}}=(_{{key.id}} : {{value[:type]}} {{ (value[:nilable] ? "?" : "").id }})
        @{{key.id}} = _{{key.id}}
      end

      def {{key.id}}
        @{{key.id}}
      end
    {% end %}

    def initialize(
      {% for name, opts in properties %}
        @{{name.id}} : {{opts[:type]}},
      {% end %}
    )
    end

    def initialize(
      {% for name, opts in properties %}
        {% if !opts[:nilable] %}
          @{{name.id}} : {{opts[:type]}},
        {% end %}
      {% end %}
    )
    end

    {% for adatper in adapters %}
      CROM.{{adatper.id}}_adapter({{properties}})
    {% end %}

    def self.fields
      {{properties}}
    end

    def __get(%name : Symbol)
      case %name
        {% for key, value in properties %}
          when :{{key.id}} then {{key.id}}
        {% end %}
      end
    end
  end
end
