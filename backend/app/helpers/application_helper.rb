# frozen_string_literal: true

module ApplicationHelper

  def react_component(name, props = {}, options = {}, &block)
    html_options = options.reverse_merge(data: { react_class: name,
                                                 react_props: camelize_props(props).to_json })

    content_tag(:div, '', html_options, &block)
  end

  def camelize_props(props)
    case props
    when Hash
      props.each_with_object({}) do |(key, value), new_props|
        new_key = key.to_s.camelize(:lower)
        new_value = camelize_props(value)
        new_props[new_key] = new_value
      end
    when Array
      props.map { |item| camelize_props(item) }
    else
      props
    end
  end

end
