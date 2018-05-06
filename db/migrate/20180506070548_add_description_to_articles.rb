class AddDescriptionToArticles < ActiveRecord::Migration
  def change
    # articles is table name, description is attribute name, text is type of attricute
    add_column :articles, :description, :text
    add_column :articles, :created_at, :datetime #timestamps tracked by rails
    add_column :articles, :updated_at, :datetime
  end
end
