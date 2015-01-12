class CreateSharedDecks < ActiveRecord::Migration
  def change
    create_table :shared_decks do |t|
      t.references :deck, index: true
      t.references :investor, index: true
      t.references :individual, index: true
      t.boolean :pending

      t.timestamps null: false
    end
    add_foreign_key :shared_decks, :individuals
    add_foreign_key :shared_decks, :investors
  end
end
