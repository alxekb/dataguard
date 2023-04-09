# frozen_string_literal: true

# class Person
#
# Person is a class that represents a person in a company
class Person < ApplicationRecord
  has_one :company_unit_person
  has_one :company_unit, through: :company_unit_person

  validates :company_unit, uniqueness: { scope: :company_unit }, allow_blank: true
end
