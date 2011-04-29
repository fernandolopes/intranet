class CreateFrequenciaJustificadas < ActiveRecord::Migration
  def self.up
    create_table :frequencia_justificadas do |t|
      t.string :matricula
      t.date :data
      t.integer :justificativa_id

      t.timestamps
    end
    add_index(:frequencia_justificadas, :justificativa_id)
  end

  def self.down
    drop_table :frequencia_justificadas
  end
end
