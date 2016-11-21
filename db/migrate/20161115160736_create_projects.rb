class CreateProjects < ActiveRecord::Migration
	def change
		create_table :projects do |t|
			t.references :user, index: true, foreign_key: true
			t.string  :title
			t.text :summary
			t.text :description
			t.string :image_url
			t.references :location, index: true, foreign_key: true
			t.references :category, index: true, foreign_key: true
			t.references :skill, index: true
			t.decimal :goal, precision: 8, scale: 2
			t.datetime :expiration_date
			t.string :status, default: "pending"

			t.timestamps null: false
		end
  end
end
