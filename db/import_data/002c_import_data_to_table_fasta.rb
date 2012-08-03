currdir = File.dirname(File.expand_path(__FILE__))
require "#{currdir}/../../config/environment.rb"
include Bio

source = "#{currdir}/../data/Trinity.wamon_p1.120526.fa"
id_table = "#{currdir}/dump_contigs.txt"

def quote(str)
  ActiveRecord::Base.connection.quote(str)
end

time_str = quote(Time.now.utc)

name2id = {}
File.open(id_table).each do |l|
	next if /^\#/.match(l)
	a = l.chomp.split(/\t/)
	name2id[a[1]] = a[0].to_i
end

# p name2id

fastas = []
FlatFile.open(FastaFormat, source).each do |fas|
	fastas << fas
end

raise unless name2id.keys.size == fastas.size

# fastas = fastas[0,1000]

STDERR.puts "#{fastas.size} entries found"

fastas.each do |fas|
	contig_id = name2id.fetch(fas.entry_id)
	raise unless contig_id
	sql = ""
	sql << "INSERT "
	sql << " INTO fasta_entries (name, record, contig_id, created_at, updated_at) "
	sql << " VALUES ('#{fas.entry_id}', 
                         #{quote(fas.to_s)},
                         #{contig_id}, #{time_str}, #{time_str}) "
	sql << ";"
  puts sql
#  puts sql[0,100] + "..."
#	FastaEntry.connection.execute(sql)
end

