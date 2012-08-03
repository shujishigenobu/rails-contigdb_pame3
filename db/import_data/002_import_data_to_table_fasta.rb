p currdir = File.dirname(File.expand_path(__FILE__))
require "#{currdir}/../../config/environment.rb"
include Bio

source = "#{currdir}/../data/Trinity.wamon_p1.120526.fa"

FastaEntry.transaction do
	FlatFile.open(FastaFormat, source).each do |fas|
		c = Contig.find_by_name(fas.entry_id)
		p c.id
		fe = FastaEntry.new(
			name:   fas.entry_id,
			record: fas.to_s,
			)
		fe.contig = c
		fe.save
	end
end