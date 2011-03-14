class CreateFrequenciaJustificativas < ActiveRecord::Migration
  def self.up
    create_table :frequencia_justificativas do |t|
      t.string :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :frequencia_justificativas
  end
end
