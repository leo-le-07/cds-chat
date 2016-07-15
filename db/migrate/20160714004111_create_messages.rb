class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :conversation, foreign_key: true
      t.string :content
      t.integer :status
      t.timestamp :open_at

      t.timestamps
    end
  end
end
