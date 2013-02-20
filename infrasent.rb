# coding: utf-8

require './in_markdown.rb'
require './out_impress.rb'

  text_markdown = IO.read(ARGV[0])
  erb_template = IO.read("./template/impress.erb")

  in_markdown = InMarkdown.from_markdown(text_markdown)
  title = in_markdown.title
  pages = in_markdown.pages
  html_impress = OutImpress.new(title, pages, erb_template).to_html

  File.open("index.html", "w") do |f|
    f << html_impress
  end
