class CreateFramedpSummaries < ActiveRecord::Migration
  def change
    create_table :framedp_summaries do |t|
      t.string :contig_name
      t.string :orf_name
      t.integer :start_pos
      t.integer :end_pos
      t.string :strand, limit: 1
      t.string :pred_type
      t.text :aaseq
      t.integer :aalen
      t.integer :contig_id

      t.timestamps
    end
    add_index :framedp_summaries, :contig_name
    add_index :framedp_summaries, :orf_name
    add_index :framedp_summaries, :contig_id
  end
end
