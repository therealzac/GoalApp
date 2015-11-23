class Goal < ActiveRecord::Base
  validates :content, :user_id, :exposure, :status, presence: true
  belongs_to :user
end
