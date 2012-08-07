#=== conf ===
klass = "FramedpSummary"
name_method = :orf_name
#===

currdir = File.dirname(File.expand_path(__FILE__))
require "#{currdir}/../../config/environment.rb"

puts "\# " + %w{id name}.join("\t")
klass.constantize.all.each do |x|
	puts [x.id, x.send(name_method)].join("\t")
end