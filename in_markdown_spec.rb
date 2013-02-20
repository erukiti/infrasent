# coding: utf-8

require './in_markdown.rb'

describe InMarkdown do
  before do
    @in_markdown = InMarkdown.from_markdown <<EOF
title
=====

タイトル

hoge
----

ほげ

fuga
----

ふが
EOF
  end

  it "" do
    @in_markdown.title.should == 'title'
  end

  it "" do
    @in_markdown.pages.size.should == 3
    @in_markdown.pages[0].html =~ /タイトル/
    @in_markdown.pages[1].html =~ /ほげ/
    @in_markdown.pages[2].html =~ /ふが/
  end
end

describe InMarkdown do
  before do
    @in_markdown = InMarkdown.from_html <<EOF
<h1 id="h1">title</h1>
<p>タイトル</p>
<h2 id="h2">hoge</h2>
<p>ほげ</p>
EOF
  end

  it "" do
    @in_markdown.title.should == 'title'
  end

  it "" do
    @in_markdown.pages.size.should == 2
    @in_markdown.pages[0].html.should == <<EOF
<h1 id="h1">title</h1>
<p>タイトル</p>
EOF
    @in_markdown.pages[1].html.should == <<EOF
<h2 id="h2">hoge</h2>
<p>ほげ</p>
EOF
  end
end

