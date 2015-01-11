class AddAttachmentLogoToDecks < ActiveRecord::Migration
  def self.up
    change_table :decks do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :decks, :logo
  end
end
