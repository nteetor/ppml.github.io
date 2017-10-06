module Jekyll
  class DividerTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
    end

    def render(context)
      "<div class=\"w-100 p-2 m-2 d-flex align-items-center\">" +
        "<div class=\"w-100 mx-auto\">" +
        "<hr class=\"w-50\">" +
        "</div>" +
        "</div>"
    end
  end
end

Liquid::Template.register_tag("divider", Jekyll::DividerTag)
