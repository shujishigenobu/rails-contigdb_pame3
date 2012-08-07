currdir = File.dirname(File.expand_path(__FILE__))
require "#{currdir}/../../config/environment.rb"
include Bio

source = "#{currdir}/../data/Trinity.wamon_p1.120526.fa.framedp.pep.fa"
table = "fasta_orf_framedp_pep_entries"

def quote(str)
  ActiveRecord::Base.connection.quote(str)
end

time_str = quote(Time.now.utc)

fastas = []
FlatFile.open(FastaFormat, source).each do |fas|

	sql = ""
  sql << "INSERT "
  sql << " INTO #{table} (name, record, created_at, updated_at) "
  sql << " VALUES ('#{fas.entry_id}', 
                   #{quote(fas.to_s)},
                   #{time_str}, #{time_str}) "
  sql << ";"
  puts sql
end
