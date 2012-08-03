class Contig < ActiveRecord::Base
  attr_accessible :name
  has_one :fasta_entry
  has_one :blastx_contig_arth14_f0_result
  has_many :framedp_summaries

  def fasta
  	Bio::FastaFormat.new(self.fasta_entry.record)
  end

  def seq
  	fasta.seq
  end
end
