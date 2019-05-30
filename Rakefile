require "bundler/gem_tasks"

task :graph do
  require 'saize'
  puts 'digraph saize {'
  #puts Matsuya::Sample.map{|m| 'begin -> ' + m.pattern.join(' -> ') + ' -> end;' }.join("\n")
  puts Saize::Sample.map{|m| [:begin, *m.pattern, :end].each_cons(2).map{|a,b| "  #{a} -> #{b};" } }.flatten.uniq.join("\n")
  puts '}'
end
