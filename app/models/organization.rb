class Organization < ActiveRecord::Base
  has_many :locations
  belongs_to :category
  has_many :events
  belongs_to :album
  belongs_to :user
  
  acts_as_authorization_object
  
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :category_id
  validates_presence_of :email
  validates_presence_of :user_type
  
  def self.updateAlbum(id,album)
    org = find_by_id(id)
    org.album_id = album
    org.save!
  end
  
end
