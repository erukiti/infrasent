# coding: utf-8

require 'erb'

class OutImpress
  def initialize(title, pages, erb_template)
    @title = title.strip
    @pages = pages
    @erb_template = erb_template
  end

  def to_html
    @html ||= ERB.new(@erb_template).result(binding).strip + "\n"
  end
end

