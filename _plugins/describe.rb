module Jekyll
  class StepBlock < Liquid::Block
    def initialize(tag_name, args, tokens)
      super
      @args = args
    end

    def render(context)
      body = super
      "<div class=\"step row\">\n#{body}\n</div>"
    end
  end
  
  class DescriptionBlock < Liquid::Block
    def initialize(tag_name, args, tokens)
      super
      @args = args
    end

    def render(context)
      desc = args.strip
      body = super

      "<div class=\"col col-12 col-sm-3 col-md-4 col-lg-5 mb-3 mb-sm-0\">" +
        "#{desc}" +
        "</div>"
    end
  end

  class ExampleBlock < Liquid::Block
    def intialize(tag_name, args, tokens)
      super
      @args = args.strip
    end

    def render(context)
      type = case args
             when /^rstudio$/ then "rstudio"
             when /^terminal$/ then "terminal"
             else ""
             end

      type = type.length ? " " + type : type
      
      "<div class=\"#{type} col col-12 col-sm-9 col-md-8 col-lg-7\">" +
        "#{body}" +
        "</div>"
    end
  end
  
end


Liquid::Template.register_tag("step", Jekyll::StepBlock)
Liquid::Template.register_tag("describe", Jekyll::DescriptionBlock)
Liquid::Template.register_tag("example", Jekyll::ExampleBlock)
