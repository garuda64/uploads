class CreateUps < ActiveRecord::Migration
  def change
    create_table :ups do |t|
      t.string :usuario
      t.string :adjunto

      t.timestamps null: false
    end
  end
end
