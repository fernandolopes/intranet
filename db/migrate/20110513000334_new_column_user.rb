class NewColumnUser < ActiveRecord::Migration
  def self.up
    add_column :users, :nome, :string
    add_column :users, :setor_id, :integer
    add_column :users, :profissao_id, :integer
    add_column :users, :matricula, :string
    add_index(:users, :setor_id)
    add_index(:users, :profissao_id)
    add_column :users, :role, :string
  end

  def self.down
    remove_column :users, :nome
    remove_column :users, :setor_id
    remove_column :users, :profissao_id
    remove_column :users, :matricula
    remove_column :users, :role
  end
end
