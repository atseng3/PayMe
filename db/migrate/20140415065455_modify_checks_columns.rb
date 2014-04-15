class ModifyChecksColumns < ActiveRecord::Migration
  def change
    change_column :checks, :tax, :float, :default => 0
    change_column :checks, :tip, :float, :default => 0
    change_column :checks, :complete, :boolean, :default => false
  end
end
