class AddColumnFramdpSummaryIdToFastaOrfFramedpPepEntries < ActiveRecord::Migration
  def change
     add_column :fasta_orf_framedp_pep_entries, :framedp_summary_id, :integer
     add_index  :fasta_orf_framedp_pep_entries, :framedp_summary_id, :unique => true
  end
end
