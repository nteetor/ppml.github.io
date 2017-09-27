module Jekyll
  class TerminalBlock < Liquid::Block
    def initialize(tag_name, args, tokens)
      super
      @args = args
    end

    def render(context)
      body = super
               .gsub("<", "&lt;")
               .gsub(/(?!\n)>/, "&gt;")
               .gsub(/```(\s*\n\s*(?:\$|$))/, "</pre>\\1")
               .gsub(/^\s*```/, "<pre>")
               .gsub(/\$\s*([^\n]+)(?:\n|$)/, "<p>\\1</p>\n")

      "<div class=\"terminal-card card\">" + 
        "<div class=\"card-body flow-text\">" +
        "<div class=\"card-title\">" +
        "<span class=\"fas fa-circle\"></span>" +
	"<span class=\"fas fa-circle\"></span>" +
	"<span class=\"fas fa-circle\"></span>" +
        "</div>" +
        "#{body}" +
        "<p></p>" + 
        "</div>" +
        "</div>"
    end
  end

end

Liquid::Template.register_tag("terminal", Jekyll::TerminalBlock)
