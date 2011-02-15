class CreateOrigens < ActiveRecord::Migration
  def self.up
    create_table :origens do |t|
      t.string :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :origens
  end
end
