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

ActiveRecord::Schema.define(:version => 20110512153214) do

  create_table "base_conhecimentos", :force => true do |t|
    t.string   "titulo"
    t.text     "descricao"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "base_conhecimentos", ["usuario_id"], :name => "index_base_conhecimentos_on_usuario_id"

  create_table "fichario_andamento_fichas", :force => true do |t|
    t.integer  "ficha_id"
    t.integer  "andamento_id"
    t.date     "data"
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fichario_andamento_fichas", ["andamento_id"], :name => "index_fichario_andamento_fichas_on_andamento_id"
  add_index "fichario_andamento_fichas", ["ficha_id"], :name => "index_fichario_andamento_fichas_on_ficha_id"

  create_table "fichario_andamentos", :force => true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fichario_assuntos", :force => true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fichario_fichas", :force => true do |t|
    t.date     "pja"
    t.string   "interessado"
    t.string   "processo"
    t.string   "cpf"
    t.date     "entrada"
    t.string   "fone"
    t.string   "celular"
    t.string   "matricula"
    t.integer  "assunto_id"
    t.integer  "origem_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fichario_fichas", ["assunto_id"], :name => "index_fichario_fichas_on_assunto_id"
  add_index "fichario_fichas", ["origem_id"], :name => "index_fichario_fichas_on_origem_id"

  create_table "fichario_origens", :force => true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "frequencia_justificadas", :force => true do |t|
    t.string   "matricula"
    t.date     "data"
    t.integer  "justificativa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "frequencia_justificadas", ["justificativa_id"], :name => "index_frequencia_justificadas_on_justificativa_id"

  create_table "frequencia_justificativas", :force => true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "frequencia_orgaos", :force => true do |t|
    t.string   "orgao"
    t.text     "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "frequencia_pontos", :force => true do |t|
    t.datetime "data"
    t.string   "matricula"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "frequencia_profissoes", :force => true do |t|
    t.string   "profissao"
    t.text     "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "frequencia_setores", :force => true do |t|
    t.integer  "orgao_id"
    t.string   "setor"
    t.text     "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "frequencia_setores", ["orgao_id"], :name => "index_frequencia_setores_on_orgao_id"

  create_table "usuarios", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nome"
    t.integer  "setor_id"
    t.integer  "profissao_id"
    t.string   "matricula"
    t.string   "role"
  end

  add_index "usuarios", ["email"], :name => "index_usuarios_on_email", :unique => true
  add_index "usuarios", ["profissao_id"], :name => "index_usuarios_on_profissao_id"
  add_index "usuarios", ["reset_password_token"], :name => "index_usuarios_on_reset_password_token", :unique => true
  add_index "usuarios", ["setor_id"], :name => "index_usuarios_on_setor_id"

end
