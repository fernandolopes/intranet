class CreateFrequenciaSetores < ActiveRecord::Migration
  def self.up
    create_table :frequencia_setores do |t|
      t.integer :orgao_id
      t.string :setor
      t.text :descricao

      t.timestamps
    end
    add_index(:frequencia_setores, :orgao_id)
  end

  def self.down
    drop_table :frequencia_setores
  end
end
