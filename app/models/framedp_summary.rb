class FramedpSummary < ActiveRecord::Base
  attr_accessible :aaseq, :contig_id, :contig_name, :from, :orf_name, :strand, :to, :type
  belongs_to :contig
end
