class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :location
      t.boolean :is_public, default: true
      t.datetime :time

      t.timestamps null: false
    end
  end
end
