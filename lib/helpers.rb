def has_previous_article?(article)
  sorted_articles.index(article) + 1 < sorted_articles.size
end

def has_next_article?(article)
  sorted_articles.index(article) > 0
end

def previous_articles(article, n=1)
  @sorted_articles ||= sorted_articles
  index = @sorted_articles.index(article)
  last = @sorted_articles.size - 1
  if index >= last
    []
  elsif index + n <= last
    @sorted_articles[index+1, n]
  else
    @sorted_articles[index+1, last - index]
  end
end

def next_articles(article, n=1)
  @sorted_articles ||= sorted_articles
  index = @sorted_articles.index(article)
  if index <= 0
    []
  elsif index - n >= 0
    @sorted_articles[index-n, n]
  else
    @sorted_articles[0, index]
  end
end

# Tag methods yoinked from Sinatra methods and slightly modified

def stylesheet_link_tag(string_or_array, *args)
  files = string_or_array.is_a?(Array) ? string_or_array : [string_or_array]
  options = {
    :charset => "utf-8",
    :media => "screen, projection",
    :rel => "stylesheet",
    :type => "text/css",
  }.merge(args.last.is_a?(::Hash) ? pop : {})

  files.map do |file|
    path = "/assets/stylesheets/#{file}.css"
    options[:href] = path
    tag(:link, options)
  end.join("\n")

end

def javascript_include_tag(string_or_array, *args)
  files = string_or_array.is_a?(Array) ? string_or_array : [string_or_array]
  options = {
    :charset => "utf-8",
    :type => "text/javascript"
  }.merge(args.last.is_a?(::Hash) ? pop : {})

  files.map do |file|
    path = "/assets/javascript/#{file}.js"
    options[:src] = path
    content_tag(:script, "", options)
  end.join("\n")

end

def tag(name,options={})
  return "<#{name} " + options.map{|k, v| "#{k}='#{v}'"}.join(' ') + "/>"
end

def content_tag(name,content,options={})
  "<#{name} " + options.map{|k, v| "#{k}='#{v}'"}.join(' ') + ">#{content}</#{name}>"
end