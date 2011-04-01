class CreateFicharioOrigens < ActiveRecord::Migration
  def self.up
    create_table :fichario_origens do |t|
      t.string :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :fichario_origens
  end
end
