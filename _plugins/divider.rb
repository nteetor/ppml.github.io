module Jekyll
  class DividerTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
    end

    def render(context)
      "<div class=\"row\">" +
        "<div class=\"col col-12 col-sm-6 mx-sm-auto my-3\">" +
        "<hr>" +
        "</div>" +
        "</div>"
    end
  end
end

Liquid::Template.register_tag("divider", Jekyll::DividerTag)
