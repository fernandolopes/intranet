class CreatePontos < ActiveRecord::Migration
  def self.up
    create_table :pontos do |t|
      t.date :data
      t.time :hora1
      t.time :hora2
      t.time :total1
      t.time :hora3
      t.time :hora4
      t.time :total2
      t.time :hora5
      t.time :hora6
      t.time :total3
      t.time :total_geral
      t.string :matricula

      t.timestamps
    end
  end

  def self.down
    drop_table :pontos
  end
end
