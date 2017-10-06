module Jekyll
  module BasenameFilter
    def basename(input)
      File.basename(input, ".*")
    end
  end

  module IndexOfFilter
    def index_of(input, item)
      input.index {|e| /#{item}$/.match(e) }
    end
  end

  module RegexFilter
    def replace_regex(input, reg_str, repl_str)
      re = Regexp.new(reg_str, Regxp::MULTILINE)

      input.gsub(re, repl_str)
    end
  end

  module ParagraphSplit
    def paragraph_split(input)
      input.to_s.split(/\n\s*\n/)
    end
  end
end

Liquid::Template.register_filter(Jekyll::BasenameFilter)
Liquid::Template.register_filter(Jekyll::IndexOfFilter)
Liquid::Template.register_filter(Jekyll::RegexFilter)
Liquid::Template.register_filter(Jekyll::ParagraphSplit)
