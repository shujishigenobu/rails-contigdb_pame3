currdir = File.dirname(File.expand_path(__FILE__))
require "#{currdir}/../../config/environment.rb"

puts "\# " + %w{id name}.join("\t")
FastaOrfFramedpNucEntry.all.each do |x|
	puts [x.id, x.name].join("\t")
end