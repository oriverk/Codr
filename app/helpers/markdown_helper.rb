module MarkdownHelper
  require 'rouge/plugins/redcarpet'
  # https://github.com/vmg/redcarpet#and-its-like-really-simple-to-use
  class HTMLwithRouge < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet

    def header(text, level)
      level += 1
      "<h#{level}>#{text}</h#{level}>"
    end
  end

  Render_options = {
    filter_html: true,
    hard_wrap: true
  }

  Redcarpet_options = {
    autolink: true,
    space_after_headers: true,
    no_intra_emphasis: false,
    fenced_code_blocks: true,
    tables: true,
    hard_wrap: true,
    xhtml: true,
    lax_html_blocks: true,
    strikethrough: true
  }
  
  def markdown(content)
    renderer = HTMLwithRouge.new(Render_options)
    markdown = Redcarpet::Markdown.new(renderer, Redcarpet_options)
    html = markdown.render(content)
  end
end