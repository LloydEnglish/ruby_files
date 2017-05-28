class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :owner_name
      t.integer :card_number
      t.integer :security_code
      t.datetime :exp_date
      t.integer :user_id
      t.integer :order_id

      t.timestamps
    end
  end
end
