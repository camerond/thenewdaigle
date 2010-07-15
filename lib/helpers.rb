

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