class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'citext'

    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.citext :first_name
      t.citext :last_name

      t.timestamps
    end
  end
end
