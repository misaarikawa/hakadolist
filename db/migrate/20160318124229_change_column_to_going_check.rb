class ChangeColumnToGoingCheck < ActiveRecord::Migration
  def change
    change_column :going_checks, :is_read, :boolean, null: false, default: false
  end
end
