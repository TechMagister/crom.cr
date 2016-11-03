module CROM
  macro mapping(adapter, properties)
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

    alias InnerCROMType = NamedTuple(
    	{% for key, opts in properties %}
        {{key.id}}: {{opts[:type].id}}{{ (opts[:nilable] ? "?" : "").id }},
      {% end %}
    )

    def to_crom() : InnerCROMType
      {
        {% for key, opts in properties %}
          {{key.id}}: {{key.id}},
        {% end %}
      }
    end

    def from_crom(inner : InnerCROMType)
      {% for key, opts in properties %}
        @{{key.id}} = inner[:{{key.id}}]
      {% end %}
    end

    CROM.{{adapter.id}}_adapter({{properties}})

  end
end
