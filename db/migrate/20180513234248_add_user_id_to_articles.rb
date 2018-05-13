class AddUserIdToArticles < ActiveRecord::Migration
  def change
              #  table   column name  type 
    add_column :articles, :user_id, :integer #foreign key has to be integer
  end
end
