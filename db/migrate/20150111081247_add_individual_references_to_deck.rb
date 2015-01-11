class AddIndividualReferencesToDeck < ActiveRecord::Migration
  def change
    add_reference :decks, :individual, index: true
    add_foreign_key :decks, :individuals
  end
end
