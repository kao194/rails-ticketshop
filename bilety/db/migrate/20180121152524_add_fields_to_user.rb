class AddFieldsToUser < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :name, :string
  	add_column :users, :date_of_birth, :date
  	add_column :users, :address, :text
  	add_column :users, :phone, :string

  	remove_column :tickets, :name
  	remove_column :tickets, :address
  	remove_column :tickets, :email_address
  	remove_column :tickets, :phone
  end
end
