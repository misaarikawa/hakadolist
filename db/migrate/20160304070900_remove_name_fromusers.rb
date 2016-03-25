class RemoveNameFromusers < ActiveRecord::Migration
  def change
    remove_column :users, :name, :string
    remove_column :users, :name_kana, :string
  end
end
