class CreateAsignateConversations < ActiveRecord::Migration
  def change
    create_table :asignate_conversations do |t|
      t.integer :user_id
      t.integer :conversation_id

      t.timestamps
    end
  end
end
