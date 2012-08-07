class CreateFastaOrfFramedpPepEntries < ActiveRecord::Migration
  def change
    create_table :fasta_orf_framedp_pep_entries do |t|
      t.string :name
      t.text :record

      t.timestamps
    end
    add_index :fasta_orf_framedp_pep_entries, :name
  end
end
