module Jekyll
  module BasenameFilter
    def basename(input)
      File.basename(input, ".*")
    end
  end
end

Liquid::Template.register_filter(Jekyll::BasenameFilter)
