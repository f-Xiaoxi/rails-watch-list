class AddUrlToLists < ActiveRecord::Migration[7.0]
  def change
    add_column :lists, :url, :string
  end
end
