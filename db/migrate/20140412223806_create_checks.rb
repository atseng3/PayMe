class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.float :amount
      t.timestamps
    end
  end
end
