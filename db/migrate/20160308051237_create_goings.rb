class CreateGoings < ActiveRecord::Migration
  def change
    create_table :goings do |t|

      t.integer :user_id
      t.integer :task_id
      t.text    :image
      t.text    :text

      t.timestamps null: false
    end
  end
end
