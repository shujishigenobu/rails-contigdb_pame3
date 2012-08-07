class AddColumnFramdpSummaryIdToFastaOrfFramedpNucEntries < ActiveRecord::Migration
  def change
  	add_column :fasta_orf_framedp_nuc_entries, :framedp_summary_id, :integer
  	add_index  :fasta_orf_framedp_nuc_entries, :framedp_summary_id, :unique => true
  end
end
