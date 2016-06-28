class CreatePairs < ActiveRecord::Migration
  def change
    create_table :pairs do |t|
      t.integer :stud1
      t.integer :stud2

      t.timestamps null: false
    end
  end
end
