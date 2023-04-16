# frozen_string_literal: true

# class Venue
#
# Venue is a facility where LunchEvent is held
class Venue < ApplicationRecord
  extend Schedulable

  has_many :lunch_events

  validates :name, presence: true, uniqueness: true
end
