class AddLocationToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :location, :string, default: "San Francisco"
  end
end
