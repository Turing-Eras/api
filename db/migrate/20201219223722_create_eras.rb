class CreateEras < ActiveRecord::Migration[6.1]
  def change
    create_table :eras do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.string :color

      t.timestamps
    end
  end
end
