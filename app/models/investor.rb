class Investor < ActiveRecord::Base
  has_one :user, as: :meta, dependent: :destroy
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage/
  accepts_nested_attributes_for :user
  has_many :shared_decks
end
