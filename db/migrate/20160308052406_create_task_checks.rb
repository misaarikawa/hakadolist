class CreateTaskChecks < ActiveRecord::Migration
  def change
    create_table :task_checks do |t|
      t.integer :user_id
      t.integer :task_id
      t.boolean :is_read

      t.timestamps null: false
    end
  end
end
