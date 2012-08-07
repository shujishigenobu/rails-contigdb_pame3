# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120807015157) do

  create_table "blastx_contig_arth14_f0_results", :force => true do |t|
    t.string   "query"
    t.integer  "contig_id"
    t.text     "record"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "blastx_contig_arth14_f0_results", ["contig_id"], :name => "index_blastx_contig_arth14_f0_results_on_contig_id"
  add_index "blastx_contig_arth14_f0_results", ["query"], :name => "index_blastx_contig_arth14_f0_results_on_query"

  create_table "contigs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "contigs", ["name"], :name => "index_contigs_on_name", :unique => true

  create_table "fasta_entries", :force => true do |t|
    t.string   "name"
    t.text     "record"
    t.integer  "contig_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "fasta_entries", ["name"], :name => "index_fasta_entries_on_name", :unique => true

  create_table "framedp_summaries", :force => true do |t|
    t.string   "contig_name"
    t.string   "orf_name"
    t.integer  "start_pos"
    t.integer  "end_pos"
    t.string   "strand",      :limit => 1
    t.string   "pred_type"
    t.text     "aaseq"
    t.integer  "aalen"
    t.integer  "contig_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "framedp_summaries", ["contig_id"], :name => "index_framedp_summaries_on_contig_id"
  add_index "framedp_summaries", ["contig_name"], :name => "index_framedp_summaries_on_contig_name"
  add_index "framedp_summaries", ["orf_name"], :name => "index_framedp_summaries_on_orf_name"

end
