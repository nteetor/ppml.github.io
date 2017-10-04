module Jekyll
  module RegexFilter
    def replace_regex(input, reg_str, repl_str)
      re = Regexp.new(reg_str, Regxp::MULTILINE)

      input.gsub(re, repl_str)
    end
  end
end

Liquid::Template.register_filter(Jekyll::RegexFilter)
