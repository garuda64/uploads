class CreateAppConfigurations < ActiveRecord::Migration[5.2]
  def change
    create_table :app_configurations do |t|
      t.string :sorteo_type
      t.text :sorteo_banner_url
      t.integer :sorteo_timeout

      t.timestamps
    end
  end
end
