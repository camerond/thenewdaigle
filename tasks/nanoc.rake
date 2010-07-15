require 'rake/clean'
CLEAN.include("output/**")

desc "Compile site HTML using nanoc."
task :compile do
  system 'nanoc co'
end

desc "Start the nanoc autocompiler."
task :auto do
  system 'nanoc autocompile -H mongrel -p 9210'
end

desc "Start the nanoc autocompiler in the background."
task :quiet do
  system 'nanoc autocompile -H mongrel -p 9210 > log/nanoc-autocompile.log 2>&1 &'
end
