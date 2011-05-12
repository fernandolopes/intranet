class AddRoleToUsuarios < ActiveRecord::Migration
  def self.up
    add_column :usuarios, :role, :string
  end

  def self.down
    remove_column :usuarios, :role
  end
end
