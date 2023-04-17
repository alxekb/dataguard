# frozen_string_literal: true

class CreateLunchEventsGroups < ActiveRecord::Migration[7.0] # :nodoc:
  def change
    create_table :lunch_events_groups do |t|
      t.references :leader, null: false, foreign_key: { to_table: :people }
      t.references :lunch_event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
