class AddTaxTipColumnsToCheck < ActiveRecord::Migration
  def change
    add_column :checks, :tax, :float
    add_column :checks, :tip, :float
    add_column :checks, :complete, :boolean
  end
end
