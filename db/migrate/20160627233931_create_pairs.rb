class CreatePairs < ActiveRecord::Migration
  def change
    create_table :pairs do |t|
      t.integer :stud1
      t.integer :stud2
      t.integer :score, {default: 0}

      t.timestamps null: false
    end
  end
end
