class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :name
      t.string :email
      t.integer :ticket_no
      t.boolean :waiting

      t.timestamps null: false
    end
  end
end
