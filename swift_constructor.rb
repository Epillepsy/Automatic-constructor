#!/usr/bin/env ruby
def read_file(file_name)
  file = File.open(file_name, 'r')
  data = file.read
  file.close
  data
end

construct_prototype = ''
construct_content = ''
read_file(ARGV[0]).scan(/var ((.*):.*)/).each do |match|
  construct_prototype += match[0] + ', '
  construct_content += '\tself.' + match[1] + ' = ' + match[1] + '\n'
end

construct_prototype = construct_prototype[0...-2]
construct_content = construct_content[0...-1]
result = "init(#{construct_prototype}){\n#{construct_content}\n}"
puts result
open(ARGV[0], 'a') do |f|
  f << result
end
