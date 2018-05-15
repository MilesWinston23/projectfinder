class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :Username, :string
    add_column :users, :Location, :string
    add_column :users, :Profession, :string
    add_column :users, :Education, :String
    add_column :users, :Biography, :text
  end
end
