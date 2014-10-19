class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.string :conversation

      t.timestamps
    end
  end
end
