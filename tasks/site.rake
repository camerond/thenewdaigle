namespace :site do

  desc "Deploy site."
  task :deploy do
    system "rake blog:check"
    system "rake deploy:rsync"
  end
  
end