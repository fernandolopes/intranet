class CreateFrequenciaOrgaos < ActiveRecord::Migration
  def self.up
    create_table :frequencia_orgaos do |t|
      t.string :orgao
      t.text :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :frequencia_orgaos
  end
end
