require 'nanoc3/tasks'

Dir['tasks/*.rake'].sort.each { |rakefile| load rakefile }

task :default => ['blog:check', :clean, :compile, :auto]
