class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :location
      t.integer :admin

      t.timestamps null: false
    end
  end
end
