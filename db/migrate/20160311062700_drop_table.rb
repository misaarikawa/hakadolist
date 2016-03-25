class DropTable < ActiveRecord::Migration
  def change

    drop_table :feed_contents
    drop_table :comments
  end
end
