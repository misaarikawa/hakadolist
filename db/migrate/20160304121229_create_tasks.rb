class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.string  :title
      t.text    :image
      t.text    :detail
      t.boolean :is_done

      t.timestamps null: false
    end
  end
end
