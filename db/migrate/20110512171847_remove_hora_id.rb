class RemoveHoraId < ActiveRecord::Migration
  def self.up
    remove_column :usuarios, :hora_id
  end

  def self.down
    add_column :usuario, :hora_id, :integer
  end
end
