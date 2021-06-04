class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :username
      t.string :password
      t.integer :wins
      t.integer :losses
      t.string :recipient

      t.timestamps
    end
  end
end
