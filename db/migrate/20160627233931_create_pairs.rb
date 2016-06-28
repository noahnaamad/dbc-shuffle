class CreatePairs < ActiveRecord::Migration
  def change
    create_table :pairs do |t|
      t.integer :stud1_id
      t.integer :stud2_id
      t.integer :score, {default: 0}

      t.timestamps null: false
    end
  end
end
