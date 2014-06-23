class RemoveNameAndAddEmailToUser < ActiveRecord::Migration
  def change
  	remove_column :users, :name
  	add_column :users, :email, :string
  end
end
