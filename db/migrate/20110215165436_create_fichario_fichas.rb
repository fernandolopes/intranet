class CreateFicharioFichas < ActiveRecord::Migration
  def self.up
    create_table :fichario_fichas do |t|
      t.date :pja
      t.string :interessado, :limit => 50
      t.string :processo, :limit => 30
      t.string :cpf, :limit => 11
      t.date :entrada
      t.string :fone, :limit => 10
      t.string :celular, :limit => 10
      t.string :matricula, :limit => 30
      t.references :assunto
      t.references :origens

      t.timestamps
    end
  end

  def self.down
    drop_table :fichario_fichas
  end
end
