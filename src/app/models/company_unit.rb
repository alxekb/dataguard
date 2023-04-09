# frozen_string_literal: true

# class CompanyUnit
#
# CompanyUnit probably it is something like a team representation.
# It has many employees, but in general they are just persons.
# Looks like if a person has a company_unit_id, then he is an employee.
# But if he has a company_unit_id and a team_id, then he is a team member. Since we have teams and unit in the ticket
# description, I assume that company_unit is a team.
class CompanyUnit < ApplicationRecord
  has_many :company_unit_people
  has_many :employees,
           through: :company_unit_people,
           source: :person
end
