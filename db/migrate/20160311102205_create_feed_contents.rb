class CreateFeedContents < ActiveRecord::Migration
  def change
    create_table :feed_contents do |t|

      t.integer :content_id
      t.integer :user_id
      t.string  :content_type
      t.string  :action_type

      t.timestamps null: false
    end
  end
end
