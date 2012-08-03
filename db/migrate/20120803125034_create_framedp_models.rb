class CreateFramedpModels < ActiveRecord::Migration
  def change
    create_table :framedp_models do |t|
      t.string :name
      t.text :gff
      t.text :nuc
      t.text :pep

      t.timestamps
    end
    add_index :framedp_models, :name
  end
end
