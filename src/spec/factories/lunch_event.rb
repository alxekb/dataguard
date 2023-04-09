# frozen_string_literal: true

FactoryBot.define do
  factory :lunch_event do
    scheduled_at { Time.zone.now }
    venue {}
  end
end
