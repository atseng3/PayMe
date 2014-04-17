class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.integer :business_id, :null => false
      t.integer :user_id, :null => false
      t.float :tax, :null => false
      t.float :tip
      t.float :amount, :null => false
      t.boolean :complete
      
      t.timestamps
    end
  end
end
