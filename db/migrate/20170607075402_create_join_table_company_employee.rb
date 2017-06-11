class CreateJoinTableCompanyEmployee < ActiveRecord::Migration[5.1]
  def change
    create_join_table :companies, :employees do |t|
      # t.index [:company_id, :employee_id]
      # t.index [:employee_id, :company_id]
      t.belongs_to :employee ,index: true 
      t.belongs_to :company  ,index: true
    end
  end
end
