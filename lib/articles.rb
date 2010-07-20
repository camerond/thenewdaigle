include Nanoc3::Helpers::Rendering
include Nanoc3::Helpers::Blogging

def partial(identifier_or_item)
  item = !item.is_a?(Nanoc3::Item) ? identifier_or_item : item_by_identifier(identifier_or_item)
  item.compiled_content(:snapshot => :pre) 
end

def render_items(opts)
  opts[:items].map {|a| render opts[:layout], :item => a.rep_named('partial') }
end

def recent_articles(size)
  render_items({:items => articles.first(size), :layout => '_article'})
end

def render_article(content)
  render_items({:items => [@item], :layout => '_article'})
end

def article_month(time)
  # parse time
  # render all articles this month
end

def create_month_archives
  # group all articles by month
  # for each month, create new item:
  # render article_month, :articles => article_month(thismonth)
end

def previous_month_url(item)

end

def next_month_url(item)
  
end

def previous_post_url(item)
  
end

def next_post_url(item)
  
end