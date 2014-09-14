class CreateBirds < ActiveRecord::Migration
  def change
    create_table :birds do |t|
      t.string :name
      t.integer :size
      t.string :colours
      t.string :description
    end
  end
end
