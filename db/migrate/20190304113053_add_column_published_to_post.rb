class AddColumnPublishedToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :published, :boolean
  end
end
