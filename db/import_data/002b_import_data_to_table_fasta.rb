p currdir = File.dirname(File.expand_path(__FILE__))
require "#{currdir}/../../config/environment.rb"
include Bio

source = "#{currdir}/../data/Trinity.wamon_p1.120526.fa"

def quote(str)
  ActiveRecord::Base.connection.quote(str)
end

time_str = quote(Time.now.utc)

fastas = []
FlatFile.open(FastaFormat, source).each do |fas|
	fastas << fas
end

# fastas = fastas[0,1000]
STDERR.puts "#{fastas.size} entries found"

fastas.each do |fas|
	c = Contig.find_by_name(fas.entry_id)
	sql = ""
	sql << "INSERT "
	sql << " INTO fasta_entries (name, record, contig_id, created_at, updated_at) "
	sql << " VALUES ('#{fas.entry_id}', 
                         #{quote(fas.to_s)},
                         #{c.id}, #{time_str}, #{time_str}) "
	sql << ";"
  puts sql
#  puts sql[0,100] + "..."
#	FastaEntry.connection.execute(sql)
end

