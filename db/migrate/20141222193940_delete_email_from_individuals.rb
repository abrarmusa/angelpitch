class DeleteEmailFromIndividuals < ActiveRecord::Migration
  def change
    remove_column :individuals, :email
    remove_column :investors, :email
  end
end
