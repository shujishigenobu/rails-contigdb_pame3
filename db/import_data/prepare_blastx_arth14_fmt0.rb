$list = "rails_seed_list.txt"

def get_name(line)
  m = /^Query\=/.match(line)
  name = m.post_match.split[0].strip
  name
end

files = Dir["/home/shige/Projects/n11723-MiuraG/Analysis/120526-wamon_trinity/BLAST/Trinity.wamon_p1.120526.fa_*.fasta.vs.arth14.aa.blastout.fmt0"]

#files = ["/home/shige/Projects/n11723-MiuraG/Analysis/120526-wamon_trinity/BLAST/Trinity.wamon_p1.120526.fa_6.fasta.vs.arth14.aa.blastout.fmt0"]

STDERR.puts files.size


curr = []
files.each do |source|
  File.open(source).each do |line|

  l = line.chomp

  ## hack for a special character \xff  
  l = l.encode("US-ASCII", 
               :invalid => :replace,
               :undef => :replace,
               :replace => " ")

    if m = /^Query\=/.match(l) || /^BLASTX 2/.match(l)

      ## reset 
      prev = curr.dup
      curr = []

      if /^Query\=/.match(prev[0])
        puts prev.join("\n") 
        puts "//"
      end

      curr << l
    else
      curr << l
    end
  end

  if /^Query\=/.match(curr[0])
    puts curr.join("\n") 
    puts "//"
  end
  curr = []
  prev = []
end