class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :github_login
      t.string :email
      t.string :image
      t.string :oauth_token
    end
    add_index :users, :github_login
  end
end
