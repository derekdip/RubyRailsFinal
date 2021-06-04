class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.string :user1Message
      t.string :user2Message
      t.references :username, foreign_key: true
      t.references :recipient, foreign_key: true

      t.timestamps
    end
  end
end
