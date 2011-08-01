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

ActiveRecord::Schema.define(:version => 20110730155008) do

  create_table "classificacoes", :force => true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "emissoras", :force => true do |t|
    t.string   "nome"
    t.integer  "canal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "emissoras", ["canal"], :name => "index_emissoras_on_canal"
  add_index "emissoras", ["nome"], :name => "index_emissoras_on_nome"

  create_table "generos", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "generos", ["nome"], :name => "index_generos_on_nome"

  create_table "generos_programas", :id => false, :force => true do |t|
    t.integer  "programa_id"
    t.integer  "genero_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interacoes", :force => true do |t|
    t.integer  "tempo"
    t.datetime "data"
    t.integer  "programa_id"
    t.integer  "stb_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "programacao_id"
  end

  create_table "programacoes", :force => true do |t|
    t.datetime "inicio"
    t.datetime "fim"
    t.integer  "emissora_id"
    t.integer  "programa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "programacoes", ["fim"], :name => "index_programacoes_on_fim"
  add_index "programacoes", ["inicio"], :name => "index_programacoes_on_inicio"

  create_table "programas", :force => true do |t|
    t.string   "nome"
    t.string   "sinopse"
    t.integer  "duracao"
    t.integer  "classificacao_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "programas", ["nome"], :name => "index_programas_on_nome"

  create_table "stbs", :force => true do |t|
    t.string   "identifier"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stbs", ["identifier"], :name => "index_stbs_on_identifier"

end
