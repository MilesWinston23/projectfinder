class AddUsernameToComments < ActiveRecord::Migration
  def change
    add_column :comments, :Username, :string
  end
end
