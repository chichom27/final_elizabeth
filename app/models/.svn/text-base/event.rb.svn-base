class Event < ActiveRecord::Base
  has_event_calendar

  belongs_to :category
  belongs_to :location
  belongs_to :organization, :foreign_key => "org_id"
  belongs_to :album
  has_many :comments
  acts_as_authorization_object
  
  validates_presence_of :name
  validates_presence_of :category_id
  validates_presence_of :start_at
  validates_presence_of :description
  validates_presence_of :org_id
  validates_presence_of :is_active
  
end

