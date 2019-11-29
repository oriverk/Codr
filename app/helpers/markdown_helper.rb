# frozen_string_literal: true

module MarkdownHelper
  REDCARPET_OPTIONS = {
    autolink: true,
    space_after_headers: true,
    no_intra_emphasis: true,
    fenced_code_blocks: true,
    tables: true,
    hard_wrap: true,
    xhtml: true,
    lax_html_blocks: true,
    strikethrough: true
  }.freeze

  def markdown_to_html(md_code)
    html_render = HTMLwithCoderay.new(filter_html: true, hard_wrap: true)
    markdown = Redcarpet::Markdown.new(html_render, REDCARPET_OPTIONS)
    markdown.render(md_code)
  end

  class HTMLwithCoderay < Redcarpet::Render::HTML
    def block_code(code, language)
      lang = case language.to_s
             when 'rb'
               'ruby'
             when 'yml'
               'yaml'
             when ''
               'md'
             else
               language
             end
      CodeRay.scan(code, language || 'md').div
    end
  end
end
