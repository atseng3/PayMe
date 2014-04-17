class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.text :name, :null => false
      t.string :password_digest, :null => false
      t.string :session_token, :null => false
      
      t.timestamps
    end
  end
end
