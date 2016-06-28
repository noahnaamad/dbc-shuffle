class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|
      t.string :name
      t.string :location, null: false
      t.integer :teacher_id

      t.timestamps null: false
    end
  end
end
