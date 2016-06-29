class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.integer :group_id, {default: 1}

      t.timestamps null: false
    end
  end
end
