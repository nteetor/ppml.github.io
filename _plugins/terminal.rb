module Jekyll
  class TerminalBlock < Liquid::Block
    def initialize(tag_name, args, tokens)
      super
      @args = args
    end

    def render(context)
      lines = super.split("\n")
      lines = lines.map { |el| el.gsub("<", "&lt;") }
      lines = lines.map { |el| el.gsub("(?!^)>", "&rt;") }
      lines = lines.map { |el| el.gsub(/^\s*\$\s*(.*)$/, "<p class=\"command text-truncate\">\\1</p>") }
      lines = lines.map { |el| el.gsub(/^\s*>\s*(.*)$/, "<p class=\"output text-truncate\">\\1</p>") }
      body = lines.join("\n")

      # Render "terminal"
      "<div class=\"terminal-card card\">" + 
        "<div class=\"card-body flow-text\">" +
        "<div class=\"card-title\">" +
        "<span class=\"fas fa-circle\"></span>" +
	"<span class=\"fas fa-circle\"></span>" +
	"<span class=\"fas fa-circle\"></span>" +
        "</div>" +
        "#{body}" +
        "<p class=\"output\">$</p>" + 
        "</div>" +
        "</div>"
    end
  end

end

Liquid::Template.register_tag("terminal", Jekyll::TerminalBlock)
