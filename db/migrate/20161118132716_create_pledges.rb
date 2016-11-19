class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|

      t.references :user, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true
      t.decimal :amount
      t.date :expiration_date
      t.string :status
      t.string :uuid

      t.timestamps null: false
    end
  end
end
