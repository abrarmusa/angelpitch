class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.text :title
      t.text :description
      t.float :amount
      t.attachment :pitch

      t.timestamps
    end
  end
end
