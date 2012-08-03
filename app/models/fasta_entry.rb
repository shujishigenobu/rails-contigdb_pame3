class FastaEntry < ActiveRecord::Base
  attr_accessible :name, :record
  belongs_to :contig
end
