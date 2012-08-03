currdir = File.dirname(File.expand_path(__FILE__))
require "#{currdir}/../../config/environment.rb"

MYSQL_TAB  = "framedp_summaries"
source = "#{currdir}/../data/Trinity.wamon_p1.120526.fa.framedp.272471339269461.summary"
id_table = "#{currdir}/../data/dump_contigs.txt"

def quote(str)
  ActiveRecord::Base.connection.quote(str)
end

time_str = quote(Time.now.utc)

## load contig_id table
name2id = {}
File.open(id_table).each do |l|
	next if /^\#/.match(l)
	a = l.chomp.split(/\t/)
	name2id[a[1]] = a[0].to_i
end

## MAIN
File.open(source).each do |l|
	a = l.chomp.split(/\t/)
  contig_name = a[0]
	contig_id = name2id.fetch(contig_name)

	raise unless contig_id

	sql = ""
	sql << "INSERT "
  sql << " INTO #{MYSQL_TAB} (contig_name, orf_name, start_pos, end_pos, strand, pred_type, aaseq, aalen, contig_id, created_at, updated_at) "
  sql << " VALUES ('#{a[0]}', '#{a[2]}', #{a[3]}, #{a[4]}, #{quote(a[5])}, #{quote(a[6])}, #{quote(a[7])}, #{a[8]}, #{contig_id}, #{time_str}, #{time_str})"
  sql << ";"
  puts sql
end