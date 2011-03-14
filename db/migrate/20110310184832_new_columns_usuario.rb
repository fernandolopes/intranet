class NewColumnsUsuario < ActiveRecord::Migration
  def self.up
    add_column :usuarios, :nome, :string
    add_column :usuarios, :setor_id, :integer
    add_column :usuarios, :profissao_id, :integer
    add_column :usuarios, :matricula, :string
    add_index(:usuarios, :setor_id)
    add_index(:usuarios, :profissao_id)
  end

  def self.down
    remove_column :usuarios, :nome
    remove_column :usuarios, :setor_id
    remove_column :usuarios, :profissao_id
    remove_column :usuarios, :matricula
  end
end
