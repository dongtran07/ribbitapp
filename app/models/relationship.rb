class Relationship < ActiveRecord::Base
	belongs_to :flower, class_name: "User"
	belongs_to :flowed, class_name: "User"
	validates :flower_id, presence: true
  validates :flowed_id, presence: true
end
