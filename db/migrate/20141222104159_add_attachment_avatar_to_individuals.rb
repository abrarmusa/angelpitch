class AddAttachmentAvatarToIndividuals < ActiveRecord::Migration
  def self.up
    change_table :individuals do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :individuals, :avatar
  end
end
