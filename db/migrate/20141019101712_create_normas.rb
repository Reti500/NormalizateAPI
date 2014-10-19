class CreateNormas < ActiveRecord::Migration
  def change
    create_table :normas do |t|
      t.string :category
      t.string :clave
      t.string :title

      t.timestamps
    end
  end
end
