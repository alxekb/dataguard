# frozen_string_literal: true

FactoryBot.define do
  factory :group, class: LunchEvents::Group do
    leader { build(:person) }
    lunch_event { build(:lunch_event) }
  end
end
