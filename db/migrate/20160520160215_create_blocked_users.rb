class CreateBlockedUsers < ActiveRecord::Migration
  def change
    create_table :blocked_users do |t|
      t.integer :user_id
      t.integer :blocked_id
      t.string :blocked_username

      t.timestamps null: false
    end
  end
end
