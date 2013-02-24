# coding: utf-8

require './in_markdown.rb'
require './out_impress.rb'

  text_markdown = IO.read(ARGV[0])
  erb_template = IO.read("./template/impress.erb")

  content = InMarkdown.from_markdown(text_markdown)
  out_impress = OutImpress.new(content, erb_template)

  File.open("index.html", "w") do |f|
    f << out_impress.to_html
  end



