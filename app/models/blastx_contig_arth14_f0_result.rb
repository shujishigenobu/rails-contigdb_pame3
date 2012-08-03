class BlastxContigArth14F0Result < ActiveRecord::Base
  attr_accessible :contig_id, :query, :record
  belongs_to :contig
end
