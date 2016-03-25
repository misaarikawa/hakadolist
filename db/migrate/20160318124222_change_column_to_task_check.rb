class ChangeColumnToTaskCheck < ActiveRecord::Migration
  def change
    change_column :task_checks, :is_read, :boolean, null: false, default: false
  end
end
