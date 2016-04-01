class CreateNoticia < ActiveRecord::Migration
  def change
    create_table :noticia do |t|
      t.string :titulo
      t.text :descripcion
      t.text :iframe
      t.string :categoria
      t.date :publicar
      t.boolean :visible
      t.string :usuario

      t.timestamps null: false
    end
  end
end
