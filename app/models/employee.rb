class Employee < ApplicationRecord

  # has_many :companies_employees
  # has_many :companies, through: :companies_employees
	has_and_belongs_to_many :companies
end
