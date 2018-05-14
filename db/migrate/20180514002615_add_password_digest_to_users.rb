class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    # column name MUST be called password_digest for has_secure_password to work
    add_column :users, :password_digest, :string
  end
end
