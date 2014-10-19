class CreateAsignateNormas < ActiveRecord::Migration
  def change
    create_table :asignate_normas do |t|
      t.integer :user_id
      t.integer :norma_id

      t.timestamps
    end
  end
end
