class CreateIncomingMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :incoming_messages do |t|
      t.integer :user_id
      t.integer :sender_id
      t.integer :status
      t.timestamps :open_at

      t.timestamps
    end
  end
end
