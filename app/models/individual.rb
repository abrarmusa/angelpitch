class Individual < ActiveRecord::Base
  has_one :user, as: :meta, dependent: :destroy
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/faceplace.png"
  accepts_nested_attributes_for :user
  has_many :decks
  has_many :shared_decks
end
