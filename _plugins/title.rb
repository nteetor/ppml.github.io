module Jekyll
  class TitleBlock < Liquid::Block
    def initialize(tag_name, args, tokens)
      super
    end

    def render(context)
#      divider = Liquid::Template.parse("{% divider %}").render
      title = super.sub(/,\s*(.+)$/, ", <small class=\"text-muted d-sm-block\">\\1</small>")

      "<div class=\"d-flex\">" +
        "<div class=\"mx-auto\">" +
        "<h4 class=\"display-4 text-center mb-0\">#{title}</h4>" +
        "</div>" +
        "</div>"
    end
  end
end

Liquid::Template.register_tag("title", Jekyll::TitleBlock)      
