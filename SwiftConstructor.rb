def read_file(file_name)
  file = File.open(file_name, "r")
  data = file.read
  file.close
  return data
end

constructPrototype = ""
constructContent = ""
read_file(ARGV[0]).scan(/var ((.*):.*)/).each do |match|
	constructPrototype += match[0] + ", "
	constructContent += "\tself." + match[1] + " = " + match[1] + "\n"
end
constructPrototype = constructPrototype[0...-2]
constructContent = constructContent[0...-1]
result = "init(#{constructPrototype}){\n#{constructContent}\n}"
puts result
open(ARGV[0], 'a') do |f|
  f << result
end