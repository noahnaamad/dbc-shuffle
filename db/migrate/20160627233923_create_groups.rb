class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :cohort_id

      t.timestamps null: false
    end
  end
end
