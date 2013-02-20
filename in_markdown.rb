# coding: utf-8

require 'kramdown'

require './page.rb'

class InMarkdown
  def self.from_markdown(text_markdown)
    self.new(Kramdown::Document.new(text_markdown).to_html)
  end

  def self.from_html(html)
    self.new(html)
  end

  def initialize(html)
    @html = html
  end

  def title
    @title ||= /<h1 id=\"[^"]+\">([^<]+)<\/h1>/.match(@html).to_a.values_at(1)[0]
  end

  def pages
    unless @pages
      pre = nil
      html = @html
      @pages = []
      while /<h[12] id=\"[^"]+\">/ =~ html
        @pages << Page.new(pre + $~.pre_match) if pre
        pre = $~[0]
        html = $~.post_match
      end
      @pages << Page.new(pre + html) if pre
    end
    @pages
  end
end

