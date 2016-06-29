class CreateTeachers < ActiveRecord::Migration
  def change
    create_table  :teachers do |t|
      t.string    :name, null: false
      t.integer   :location_id, default: 1
      t.integer   :admin, default: 0

      t.timestamps null: false
    end
  end
end
