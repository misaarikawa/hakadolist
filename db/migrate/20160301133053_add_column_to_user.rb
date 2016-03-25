class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :name_kana, :string
    add_column :users, :unit, :string
    add_column :users, :job, :string
    add_column :users, :charge, :text
    add_column :users, :image, :text
  end
end
