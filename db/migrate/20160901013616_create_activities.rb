class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.time :starttime
      t.boolean :completed
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
