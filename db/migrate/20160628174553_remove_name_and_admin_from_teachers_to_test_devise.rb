class RemoveNameAndAdminFromTeachersToTestDevise < ActiveRecord::Migration
  def change
    remove_column :teachers, :name
    remove_column :teachers, :admin
  end
end
