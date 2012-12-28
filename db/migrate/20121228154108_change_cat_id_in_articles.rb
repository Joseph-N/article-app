class ChangeCatIdInArticles < ActiveRecord::Migration
  def up
    rename_column :articles, :cat_id, :category_id
    add_index :articles, :category_id
  end

  def down
  end
end
