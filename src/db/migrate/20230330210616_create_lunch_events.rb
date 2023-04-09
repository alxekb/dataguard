class CreateLunchEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :lunch_events do |t|
      t.references :venue, null: false, foreign_key: true
      t.datetime :scheduled_at

      t.timestamps
    end
  end
end
