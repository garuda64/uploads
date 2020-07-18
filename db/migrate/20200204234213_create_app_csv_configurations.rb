class CreateAppCsvConfigurations < ActiveRecord::Migration[5.2]
  def change
    create_table :app_csv_configurations do |t|
      t.string :name
      t.string :ruta

      t.timestamps
    end
  end
end
