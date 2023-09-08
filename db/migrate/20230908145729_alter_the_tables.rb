class AlterTheTables < ActiveRecord::Migration[7.0]
  def change
    add_column :inbox_members, :inbox_scanner, :string
  end
end
