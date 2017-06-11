class Company < ApplicationRecord
	# has_many :companies_employees 
    # has_many :employees, through: :companies_employees
	has_and_belongs_to_many :employees
end
