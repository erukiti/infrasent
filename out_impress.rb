# coding: utf-8

require 'erb'

class OutImpress
  def initialize(content, erb_template)
    @title = content.title.strip
    @pages = content.pages
    @erb_template = erb_template
  end

  def to_html
    @html ||= ERB.new(@erb_template).result(binding).strip + "\n"
  end
end

