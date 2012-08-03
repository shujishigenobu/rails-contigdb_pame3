names = []
ARGF.each_with_index do |l, idx|
  next unless /^Query\=/.match(l)
  name = l.chomp.split[1]
  p [idx, name]
  raise if name == names.last
  names << name
end
