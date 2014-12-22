class AddAttachmentAvatarToInvestors < ActiveRecord::Migration
  def self.up
    change_table :investors do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :investors, :avatar
  end
end
