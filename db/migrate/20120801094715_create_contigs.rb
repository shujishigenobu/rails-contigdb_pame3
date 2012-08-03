class CreateContigs < ActiveRecord::Migration
  def change
    create_table :contigs do |t|
      t.string :name

      t.timestamps
    end

    add_index :contigs, :name, :unique => true
  end
end
