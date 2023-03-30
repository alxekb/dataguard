class CreateCompanyUnitPeople < ActiveRecord::Migration[7.0]
  def change
    create_table :company_unit_people do |t|
      t.references :company_unit, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
