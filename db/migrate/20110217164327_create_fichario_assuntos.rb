class CreateFicharioAssuntos < ActiveRecord::Migration
  def self.up
    create_table :fichario_assuntos do |t|
      t.string :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :fichario_assuntos
  end
end
