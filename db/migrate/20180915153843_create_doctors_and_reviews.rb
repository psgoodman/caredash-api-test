class CreateDoctorsAndReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :doctors do |t|
        t.string :name, null: false

        t.timestamps
    end

    create_table :reviews do |t|
        t.integer :doctor_id
        t.text :description

        t.timestamps
    end
  end
end
