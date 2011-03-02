class CreateFicharioAndamentoFichas < ActiveRecord::Migration
  def self.up
    create_table :fichario_andamento_fichas do |t|
      t.integer :ficha_id
      t.integer :andamento_id
      t.date :data
      t.string :descricao
      t.timestamps
    end
    add_index(:fichario_andamento_fichas, :andamento_id)
    add_index(:fichario_andamento_fichas, :ficha_id)
  end

  def self.down
    drop_table :fichario_andamento_fichas
  end
end
