class RelacionarUserComTipoDeContratacao < ActiveRecord::Migration
  def self.up
    add_column :users, 'tipo_de_contratacao_id', :int
    add_index :users, 'tipo_de_contratacao_id'
  end

  def self.down
    remove_column :users, 'tipo_de_contratacao_id'
  end
end
