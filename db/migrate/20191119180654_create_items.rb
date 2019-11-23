class CreateItems < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'citext'

    create_table :items do |t|
      t.string :name
      t.string :description
      t.float :unit_price
      t.references :merchant, foreign_key: true
      t.citext :name
      t.citext :description

      t.timestamps
    end
  end
end
