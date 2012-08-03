class CreateFastaEntries < ActiveRecord::Migration
  def change
    create_table :fasta_entries do |t|
      t.string  :name
      t.text    :record
      t.integer :contig_id

      t.timestamps
    end

    add_index :fasta_entries, :name, :unique=>true
  end
end
