class CreateDiscutions < ActiveRecord::Migration
  def change
    create_table :discutions do |t|
      t.string :title
      t.string :discution
      t.integer :user_id

      t.timestamps
    end
  end
end
