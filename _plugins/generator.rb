module Jekyll
  class NameGenerator < Generator
    safe true

    def generate(site)

    end
  end

  Jekyll::Hooks.register :site, :post_render do |site|

  end

  Jekyll::Hooks.register :documents, :post_render do |doc|
    doc.data['basename'] = doc.basename
  end
end
