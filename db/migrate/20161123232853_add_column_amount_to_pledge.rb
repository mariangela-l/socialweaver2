class AddColumnAmountToPledge < ActiveRecord::Migration
  def change
    add_column :pledges, :amount, :float
  end
end
