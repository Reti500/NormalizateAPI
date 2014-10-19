class CreateAsignateTags < ActiveRecord::Migration
  def change
    create_table :asignate_tags do |t|
      t.integer :tag_id
      t.integer :discution_id

      t.timestamps
    end
  end
end
