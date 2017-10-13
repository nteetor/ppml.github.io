module Jekyll
  module ReadFilter
    def read(input)
      IO.read(input)
    end
  end
  
  module IdifyFilter
    def idify(input)
      input = Utils.slugify(input)
      input.gsub(/^[a-zA-Z]+[-]/, "")
    end
  end
  
  module BasenameFilter
    def basename(input)
      File.basename(input)
    end
  end

  module IndexOfFilter
    def index_of(input, item)
      input.index {|e| /#{item}$/.match(e) }
    end
  end

  module RegexFilter
    def replace_regex(input, reg_str, repl_str)
      re = Regexp.new(reg_str, Regexp::MULTILINE)

      input.gsub(re, repl_str)
    end
  end

  module ParagraphSplit
    def paragraph_split(input)
      input.to_s.split(/\n\s*\n/)
    end
  end
end

Liquid::Template.register_filter(Jekyll::ReadFilter)
Liquid::Template.register_filter(Jekyll::IdifyFilter)
Liquid::Template.register_filter(Jekyll::BasenameFilter)
Liquid::Template.register_filter(Jekyll::IndexOfFilter)
Liquid::Template.register_filter(Jekyll::RegexFilter)
Liquid::Template.register_filter(Jekyll::ParagraphSplit)
