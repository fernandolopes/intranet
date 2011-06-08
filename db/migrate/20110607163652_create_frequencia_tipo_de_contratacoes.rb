class CreateFrequenciaTipoDeContratacoes < ActiveRecord::Migration
  def self.up
    create_table :frequencia_tipo_de_contratacoes do |t|
      t.string :titulo
      t.text :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :frequencia_tipo_de_contratacoes
  end
end
