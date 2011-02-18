class CreateFicharioAndamentos < ActiveRecord::Migration
  def self.up
    create_table :fichario_andamentos do |t|
      t.string :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :fichario_andamentos
  end
end
