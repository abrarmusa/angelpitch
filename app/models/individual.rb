class Individual < ActiveRecord::Base
  has_one :user, as: :meta, dependent: :destroy
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  accepts_nested_attributes_for :user
end
