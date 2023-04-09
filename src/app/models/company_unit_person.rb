# frozen_string_literal: true

# class CompanyUnitPerson
#
# Join table for company units and persons
class CompanyUnitPerson < ApplicationRecord
  belongs_to :company_unit
  belongs_to :person

  validates_uniqueness_of :person, scope: :company_unit
end
