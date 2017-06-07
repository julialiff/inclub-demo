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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170422235957) do

  create_table "Administrador", primary_key: "idAdministrador", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nome",  limit: 45
    t.string "email", limit: 45
    t.string "senha", limit: 45
  end

  create_table "AvaliacaoBalada", primary_key: "idAvaliacao", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "idBalada"
    t.integer  "idUsuario"
    t.string   "comentario", limit: 45
    t.string   "nota",       limit: 45
    t.datetime "dataHora"
    t.index ["idBalada"], name: "pkBalada_idx", using: :btree
    t.index ["idUsuario"], name: "pkUsuario_idx", using: :btree
  end

  create_table "AvaliacaoFesta", primary_key: "idAvaliacao", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "idFesta"
    t.integer  "idUsuario"
    t.string   "comentario", limit: 45
    t.string   "nota",       limit: 45
    t.datetime "dataHora"
    t.index ["idFesta"], name: "fkFesta_idx", using: :btree
    t.index ["idUsuario"], name: "pkUsuario_idx", using: :btree
  end

  create_table "Balada", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "idCadastro",            null: false
    t.string  "cnpj",       limit: 45
    t.string  "endereco",   limit: 45
    t.integer "numero"
    t.string  "bairro",     limit: 45
    t.string  "cidade",     limit: 45
    t.string  "estado",     limit: 45
    t.string  "cep",        limit: 45
    t.index ["idCadastro"], name: "fkAdministrador_idx", using: :btree
  end

  create_table "Cadastro", primary_key: "idCadastro", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "nome"
    t.string  "email"
    t.string  "username", limit: 20
    t.string  "senha",    limit: 50
    t.string  "telefone", limit: 20
    t.integer "tipo"
  end

  create_table "CheckIn", primary_key: "idCheckIn", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "idUsuario"
    t.integer  "idFesta"
    t.datetime "dataHora"
    t.index ["idFesta"], name: "idFesta_idx", using: :btree
    t.index ["idUsuario"], name: "idCadastro_idx", using: :btree
  end

  create_table "Estilo", primary_key: "idEstilo", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nome",      limit: 45
    t.string "descricao", limit: 45
  end

  create_table "EstiloBalada", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "idEstilo"
    t.integer "idBalada"
    t.index ["idBalada"], name: "pkBalada_idx", using: :btree
    t.index ["idEstilo"], name: "pkEstilo_idx", using: :btree
  end

  create_table "EstiloFesta", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "idEstilo"
    t.integer "idFesta"
    t.index ["idEstilo"], name: "pkEstilo_idx", using: :btree
    t.index ["idFesta"], name: "pkBalada_idx", using: :btree
  end

  create_table "Festa", primary_key: "idFesta", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "idBalada"
    t.string   "nome",     limit: 45
    t.datetime "dataHora"
    t.integer  "tipo_bar"
    t.index ["idBalada"], name: "fkBalada_idx", using: :btree
  end

  create_table "Usuario", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "idCadastro",            null: false
    t.string  "dataNasc",   limit: 45
    t.index ["idCadastro"], name: "idCadastro_idx", using: :btree
  end

  create_table "administradors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "senha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "external_dbs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "AvaliacaoBalada", "Balada", column: "idBalada", primary_key: "idCadastro", name: "pkBalada"
  add_foreign_key "AvaliacaoBalada", "Usuario", column: "idUsuario", primary_key: "idCadastro", name: "pkUsuario"
  add_foreign_key "AvaliacaoFesta", "Festa", column: "idFesta", primary_key: "idFesta", name: "fkFesta2"
  add_foreign_key "AvaliacaoFesta", "Usuario", column: "idUsuario", primary_key: "idCadastro", name: "fkUsuario"
  add_foreign_key "Balada", "Cadastro", column: "idCadastro", primary_key: "idCadastro", name: "fkAdministrador"
  add_foreign_key "CheckIn", "Festa", column: "idFesta", primary_key: "idFesta", name: "pkFesta"
  add_foreign_key "CheckIn", "Usuario", column: "idUsuario", primary_key: "idCadastro", name: "pkCadastro"
  add_foreign_key "EstiloBalada", "Balada", column: "idBalada", primary_key: "idCadastro", name: "fkBalada1"
  add_foreign_key "EstiloBalada", "Estilo", column: "idEstilo", primary_key: "idEstilo", name: "fkEstilo1"
  add_foreign_key "EstiloFesta", "Estilo", column: "idEstilo", primary_key: "idEstilo", name: "fkEstilo2"
  add_foreign_key "EstiloFesta", "Festa", column: "idFesta", primary_key: "idFesta", name: "fkFesta"
  add_foreign_key "Festa", "Balada", column: "idBalada", primary_key: "idCadastro", name: "fkBalada"
  add_foreign_key "Usuario", "Cadastro", column: "idCadastro", primary_key: "idCadastro", name: "idCadastro"
end
