class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :tags, :title, :name
  end
end
