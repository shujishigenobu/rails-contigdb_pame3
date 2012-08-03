class CreateBlastxContigArth14F0Results < ActiveRecord::Migration
  def change
    create_table :blastx_contig_arth14_f0_results do |t|
      t.string  :query
      t.integer :contig_id
      t.text    :record

      t.timestamps
    end
    add_index :blastx_contig_arth14_f0_results, :query
    add_index :blastx_contig_arth14_f0_results, :contig_id
  end
end
