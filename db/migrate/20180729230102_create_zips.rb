class CreateZips < ActiveRecord::Migration[5.2]
  def change
    create_table :zips do |t|
      t.string :zip
      t.string :cbsa

      t.timestamps
    end
  end
end
