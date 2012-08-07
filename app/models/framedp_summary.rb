class FramedpSummary < ActiveRecord::Base
  attr_accessible :aalen, :aaseq, :contig_id, :contig_name, :end_pos, :orf_name, :pred_type, :start_pos, :strand
  belongs_to :contig
  has_one :fasta_orf_framedp_nuc_entry
  has_one :fasta_orf_framedp_pep_entry
end
