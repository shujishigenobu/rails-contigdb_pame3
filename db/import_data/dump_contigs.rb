currdir = File.dirname(File.expand_path(__FILE__))
require "#{currdir}/../../config/environment.rb"

# Contig.find(:all).each do |c|
#	p c
#end

puts "\# " + %w{id name}.join("\t")
Contig.all.each do |c|
	puts [c.id, c.name].join("\t")
end
