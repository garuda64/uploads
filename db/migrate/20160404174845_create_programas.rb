class CreateProgramas < ActiveRecord::Migration
  def change
    create_table :programas do |t|
      t.string :nombre
      t.text :descripcion
      t.text :imagen
      t.text :url

      t.timestamps null: false
    end
  end
end
