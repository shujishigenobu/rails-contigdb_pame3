#=== config ===
klass = "FastaOrfFramedpNucEntry"
#===

currdir = File.dirname(File.expand_path(__FILE__))
require "#{currdir}/../../config/environment.rb"

id_table = "#{currdir}/../data/id2name-farmedp_summary.txt"

def quote(str)
  ActiveRecord::Base.connection.quote(str)
end

time_str = quote(Time.now.utc)

## load name2id table
name2id = {}
File.open(id_table).each do |l|
        next if /^\#/.match(l)
        a = l.chomp.split(/\t/)
        name2id[a[1]] = a[0].to_i
end

## MAIN
klass.constantize.transaction do
  klass.constantize.all.each do |x|
    x.framedp_summary_id = name2id.fetch(x.name)
    x.save!
  end
end
