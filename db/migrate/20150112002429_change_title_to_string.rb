class ChangeTitleToString < ActiveRecord::Migration
  def change
    change_column :decks, :title, :string
    change_column :decks, :description, :string
  end
end
