class CreateBaseConhecimentos < ActiveRecord::Migration
  def self.up
    create_table :base_conhecimentos do |t|
      t.string :titulo
      t.text :descricao
      t.integer :user_id

      t.timestamps
    end
    add_index(:base_conhecimentos, :user_id)
  end

  def self.down
    drop_table :base_conhecimentos
  end
end
