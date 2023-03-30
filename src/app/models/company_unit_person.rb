class CompanyUnitPerson < ApplicationRecord
  belongs_to :company_unit
  belongs_to :person
end
