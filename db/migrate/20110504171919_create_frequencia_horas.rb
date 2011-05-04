class CreateFrequenciaHoras < ActiveRecord::Migration
  def self.up
    create_table :frequencia_horas do |t|
      t.integer :horas
      t.time :entrada
      t.time :saida
      t.boolean :almoco

      t.timestamps
    end
  end

  def self.down
    drop_table :frequencia_horas
  end
end
