$source = "../data/Trinity.wamon_p1.120526.fa"

require 'bio'
include Bio

names = []
FlatFile.open(FastaFormat, $source).each do |fas|
	names << fas.entry_id
end

STDERR.puts "#{names.size} fasta entries found:"


require '../../config/environment.rb'


Contig.transaction do
	names.each do |n|
		Contig.create(name: n)
	end
end