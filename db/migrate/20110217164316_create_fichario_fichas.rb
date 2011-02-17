class CreateFicharioFichas < ActiveRecord::Migration
  def self.up
    create_table :fichario_fichas do |t|
      t.date :pja
      t.string :interessado
      t.string :processo
      t.string :cpf
      t.date :entrada
      t.string :fone
      t.string :celular
      t.string :matricula
      t.integer :assunto_id
      t.integer :origem_id

      t.timestamps
    end
    add_index(:fichario_fichas, :assunto_id)
    add_index(:fichario_fichas, :origem_id)
  end

  def self.down
    drop_table :fichario_fichas
  end
end
