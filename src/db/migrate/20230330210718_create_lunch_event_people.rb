class CreateLunchEventPeople < ActiveRecord::Migration[7.0]
  def change
    create_table :lunch_event_people do |t|
      t.references :lunch_event, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
