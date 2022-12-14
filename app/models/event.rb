class Event < ApplicationRecord
  scope :past, -> { where("event_date < ?", Time.now) }
  scope :future, -> { where("event_date > ?", Time.now) }

  belongs_to :creator, class_name: 'User'
  has_many :enrollments, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :enrollments, class_name: 'User'

  validates :title, :description, :event_date, presence: true
end
