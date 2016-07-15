class DropTableIncomingSentMessage < ActiveRecord::Migration[5.0]
  def change
    drop_table('incoming_messages', force: :cascade)
    drop_table('incoming_message_details')
    drop_table('sent_messages', force: :cascade)
    drop_table('sent_message_details')
  end
end
