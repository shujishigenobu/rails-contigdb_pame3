currdir = File.dirname(File.expand_path(__FILE__))
require "#{currdir}/../../config/environment.rb"

mysqltab  = "blastx_contig_arth14_f0_results"
source = "#{currdir}/../data/Trinity.wamon_p1.120526.fa.vs.arth14.aa.blastout.fmt0.all"
id_table = "#{currdir}/../data/dump_contigs.txt"

def quote(str)
  ActiveRecord::Base.connection.quote(str)
end

def get_name(line)
  m = /^Query\=/.match(line)
  name = m.post_match.split[0].strip
  name
end

time_str = quote(Time.now.utc)

name2id = {}
File.open(id_table).each do |l|
	next if /^\#/.match(l)
	a = l.chomp.split(/\t/)
	name2id[a[1]] = a[0].to_i
end

# p name2id

File.open(source).each("//\n") do |rec|

	query = get_name(rec)
	contig_id = name2id.fetch(query)

	raise unless contig_id

	sql = ""
	sql << "INSERT "
	sql << " INTO #{mysqltab} (query, contig_id, record, created_at, updated_at) "
	sql << " VALUES ('#{query}', 
                   #{contig_id},
                   #{quote(rec)}, 
                   #{time_str}, #{time_str}) "
	sql << ";"
  puts sql
end

