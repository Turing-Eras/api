class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.datetime :date
      t.string :color

      t.timestamps
    end
  end
end
