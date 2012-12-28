class AddCategoryToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :cat_id, :int
    add_index :articles, :cat_id
  end
end
