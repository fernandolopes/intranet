class CreateFrequenciaFrequencias < ActiveRecord::Migration
  def self.up
    create_table :frequencia_frequencias do |t|
      t.datetime :data
      t.string :matricula

      t.timestamps
    end
  end

  def self.down
    drop_table :frequencia_frequencias
  end
end
