# frozen_string_literal: true

class CreateLunchEventsGroupsMemberships < ActiveRecord::Migration[7.0]  # :nodoc:
  def change
    create_table :lunch_events_groups_memberships do |t|
      t.references :member, null: false, foreign_key: { to_table: :people }
      t.references :group, null: false, foreign_key: { to_table: :lunch_events_groups }

      t.timestamps
    end
  end
end
