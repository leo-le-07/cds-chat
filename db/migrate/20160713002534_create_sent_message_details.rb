class CreateSentMessageDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :sent_message_details do |t|
      t.references :sent_message, foreign_key: true
      t.string :content
      t.integer :status
      t.timestamps :open_at

      t.timestamps
    end
  end
end
