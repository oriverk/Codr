# frozen_string_literal: true

module PostsHelper
  require 'rouge/plugins/redcarpet'
  # read Redcarpet options ans extensions for anti XSS.
  # https://github.com/vmg/redcarpet#and-its-like-really-simple-to-use

  class HTML < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet

    # change # header to h2
    def header(text, level)
      level += 1
      "<h#{level}>#{text}</h#{level}>"
    end
  end

  def markdown(text)
    render_options = {
      filter_html: true,
      hard_wrap: true
    }
    # renderer を変更します
    # renderer = Redcarpet::Render::HTML.new(render_options)
    renderer = HTML.new(render_options)

    extensions = {
      autolink: false,
      fenced_code_blocks: true,
      lax_spacing: true,
      no_intra_emphasis: true,
      strikethrough: true,
      superscript: true,
      tables: false,
      highlight: true,
      disable_indented_code_blocks: true,
      space_after_headers: false
    }
    Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
  end
end
