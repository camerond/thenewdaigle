require 'find'

namespace :blog do

  desc "Write new article."
  task :new do

    dir = "content/articles/#{Time.now.year}/#{Time.now.strftime('%B').downcase}/"
    filename = dir + 'new_article.markdown'

    if File.exists?(filename)
      puts "\nA new entry already exists"
      puts "#{filename}\n\n"
    else
      FileUtils.mkdir_p(dir)
      file = File.new(filename, 'w')
      file.write("---
kind: article
title: New Article
author: #{site.config[:author]}
date_created: #{Time.now}
tags:
published: false
rep: :default
---
")
      puts 'New entry created.'
      system "open #{filename}"
    end

  end

  desc "Check for unfinished entries."
  task :check do

    Find.find('content/') do |path|
      if File.basename(path) == 'new_article.markdown'
        puts "\nYou haven't renamed your new entry yet"
        puts "#{path}\n\n"
        exit 1
      end
    end

    site = Nanoc3::Site.new('.')
    site.load_data
    site.items.select{|i| i[:kind] == 'article'}.each do |i|
      if(i[:title] == 'New Article')
        puts "\nYou haven't titled your new entry yet"
        puts "#{i.path}\n\n"
        exit 1
      elsif(!i[:author])
        puts "\nYou have an article without an author attribution"
        puts "#{i.path}\n\n"
        exit 1
      end
    end

  end
end