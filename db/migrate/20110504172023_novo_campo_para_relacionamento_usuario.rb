class NovoCampoParaRelacionamentoUsuario < ActiveRecord::Migration
  def self.up
    add_column(:usuarios, :hora_id, :integer)
    add_index(:usuarios, :hora_id)
  end

  def self.down
    remove_column(:usuarios, :hora_id)
  end
end
