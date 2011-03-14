class CreateFrequenciaProfissoes < ActiveRecord::Migration
  def self.up
    create_table :frequencia_profissoes do |t|
      t.string :profissao
      t.text :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :frequencia_profissoes
  end
end
