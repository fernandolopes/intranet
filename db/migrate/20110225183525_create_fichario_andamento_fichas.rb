class CreateFicharioAndamentoFichas < ActiveRecord::Migration
  def self.up
    create_table :fichario_andamento_fichas do |t|
      t.
      t.timestamps
    end
  end

  def self.down
    drop_table :fichario_andamento_fichas
  end
end
