headings = IO.readlines(ARGV[0]).collect do |line|
 line.match(/^[#]{1,4}/) ? ("  " * ($&.length - 1) + $'.strip) : nil
end

headings.compact!.delete_if { |line| line.match /^\s*#/ }
headings.map { |line| line.gsub!('#', '') }

File.open(ARGV[1], "w") { |file| file.write(headings.join ("\n")) }