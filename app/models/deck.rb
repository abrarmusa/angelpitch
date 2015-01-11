class Deck < ActiveRecord::Base
  has_attached_file :pitch
  validates_attachment :pitch, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}
  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :content_type => /\Aimage/, :default_url => "/images/:style/missing.png"
  belongs_to :individual
end
