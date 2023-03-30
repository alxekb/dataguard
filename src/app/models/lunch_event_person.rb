class LunchEventPerson < ApplicationRecord
  belongs_to :lunch_event
  belongs_to :person
end
