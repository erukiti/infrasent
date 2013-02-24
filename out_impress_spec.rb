# coding: utf-8

require './out_impress.rb'

class DummyPage
  attr_reader :html
  attr_reader :x
  attr_reader :y
  def initialize(html, x, y)
    @html = html
    @x = x
    @y = y
  end
end

class DummyContent
  attr_reader :title
  attr_reader :pages
  def initialize(title, pages)
    @title = title
    @pages = pages
  end
end

describe OutImpress do
  before do
    @out_impress = OutImpress.new(DummyContent.new("タイトル", [
      DummyPage.new("<h1>title</h1><p>タイトル</p>", 0, 0), 
      DummyPage.new("<h2>hoge</h2><p>ほげ</p>", 1024, 0)
    ]), <<EOF)
<tite><%= @title %></title>
<% @pages.each do |page| %><div class="step" data-x="<%= page.x %>" data-y="<%= page.y %>">
<%= page.html %>
</div>
<% end %>
EOF
  end

  it "" do
    @out_impress.to_html.should == <<EOF.strip + "\n"
<tite>タイトル</title>
<div class="step" data-x="0" data-y="0">
<h1>title</h1><p>タイトル</p>
</div>
<div class="step" data-x="1024" data-y="0">
<h2>hoge</h2><p>ほげ</p>
</div>
EOF
  end
end
