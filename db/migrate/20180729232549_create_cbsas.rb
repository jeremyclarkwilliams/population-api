class CreateCbsas < ActiveRecord::Migration[5.2]
  def change
    create_table :cbsas do |t|
      t.string :cbsa
      t.string :mdiv
      t.string :name
      t.string :lsad
      t.string :popestimate2014
      t.string :popestimate2015

      t.timestamps
    end
  end
end
