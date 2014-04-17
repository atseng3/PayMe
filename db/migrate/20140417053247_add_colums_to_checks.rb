class AddColumsToChecks < ActiveRecord::Migration
  def change
    add_column :checks, :user_id, :integer
    add_column :checks, :busines_id, :integer
  end
end
