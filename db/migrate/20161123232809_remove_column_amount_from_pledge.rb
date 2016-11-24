class RemoveColumnAmountFromPledge < ActiveRecord::Migration
  def change
    remove_column :pledges, :amount, :decimal
  end
end
