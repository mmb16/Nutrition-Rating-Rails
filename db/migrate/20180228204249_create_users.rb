class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
        t.string :username
        t.date :birthday
        t.integer :phone_number
        t.integer :card_number
      t.timestamps
    end
  end
end
