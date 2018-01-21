class AddFieldsToEvent < ActiveRecord::Migration[5.1]
  def change
  	add_column :events, :maxSeats, :integer
  	add_column :events, :adultsOnly, :boolean
  	add_column :events, :singleBuyerLimit, :integer
  end
end
